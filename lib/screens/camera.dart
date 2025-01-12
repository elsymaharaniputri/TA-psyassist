import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:psyassist_apk/bloc/login/login_bloc.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;
import 'package:image/image.dart' as img;

// import 'package:image/image.dart' as img;
// import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart';

List<CameraDescription>? cameras;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(MaterialApp(home: CameraScreen()));
}

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraImage? cameraImage;
  CameraController? cameraController;
  String output = '';
  int output2 = -1;
  late Interpreter interpreter;
  List<String> labels = [];

  @override
  void initState() {
    super.initState();
    initializeCamera();
    loadModel();
  }

//tampilkan kamera di perangkat user
  Future<void> initializeCamera() async {
    // izin kamera pengguna
    await requestCameraPermission();
    //gunakan fungsi untuk mendapatkan kamera depan belakang android user denagan fungsi package availableCameras()
    cameras = await availableCameras();
    //
    loadCamera();
  }

  //request izin
  Future<void> requestCameraPermission() async {
    var status = await Permission.camera.status;
    if (!status.isGranted) {
      await Permission.camera.request();
    }
  }

//load camera
  loadCamera() async {
    try {
      if (cameras == null || cameras!.isEmpty) {
        print('No cameras available');
        return;
      }
// instance dari CameraController dengan menggunakan kamera pertama dari daftar cameras.
//ResolutionPreset.medium digunakan untuk menentukan resolusi gambar yang akan diambil oleh kamera.
      cameraController = CameraController(cameras![0], ResolutionPreset.medium);

//memanggil metode initialize() pada cameraController untuk mempersiapkan kamera agar siap digunakan
      await cameraController!.initialize().then((value) {
        //memeriksa apakah widget saat ini masih terpasang (mounted) di dalam widget tree,jika tidak fungsi kluar
        if (!mounted) return;
//memulai aliran gambar dari kamera dengan memanggil metode startImageStream
        setState(() {
          cameraController!.startImageStream((imageStream) async {
            //simpan data stream gambar di variable
            cameraImage = imageStream;
          });
        });
      });
    } catch (e) {
      print('Failed to load camera: $e');
    }
  }

  //run model == panggil labels dan models
  //cek apakah ada gambar di cameraImage
  //cek label jika kosong maka set state jalan dan print msg
  //panggil fungsi preprocess untuk mengubah cameraImage menjadi format yang sesuai untuk input model
  //
  Future<void> runModel(String token) async {
    try {
      if (cameraImage == null) {
        print('Camera image is null');
        return;
      }

      if (labels.isEmpty) {
        print('Error: Labels are empty.');
        setState(() {
          output = 'Error: Labels not loaded.';
          output2 = -1;
        });
        return;
      }

      // Ubah gambar input kamera menjadi format sesuai input model
      var input = preprocess(cameraImage!);

      // Membuat tensor kosong untuk menyimpan hasil prediksi model
      List outputTensor =
      List.filled(labels.length, 0.0).reshape([1, labels.length]);

      // Run the model
      try {
        interpreter.run(input, outputTensor);
      } catch (e) {
        print('Interpreter error: $e');
        setState(() {
          output = 'Model run failed.';
          output2 = -1;
        });
        return;
      }

      // Find the index of the highest probability in the output tensor
      var maxIndex = 0;
      for (int i = 0; i < outputTensor[0].length; i++) {
        if (outputTensor[0][i] > outputTensor[0][maxIndex]) {
          maxIndex = i;
        }
      }

      // Update the UI with the prediction result
      setState(() {
        output = labels[maxIndex];
        output2 = maxIndex;
      });

      // Convert CameraImage to Uint8List
      final imageBytes = await convertCameraImageToBytes(cameraImage!);

      // Upload the image and index to the server
      await uploadImage(imageBytes, output, output2, token);
      print("Success upload image and labels");
    } catch (e) {
      print('Failed to run the model: $e');
      setState(() {
        output = 'Error occurred while running the model.';
        output2 = -1;
        print(output2);
      });
    }
  }

  // Fungsi untuk mengonversi nilai RGB ke objek img.Color
  img.Color customGetColor(int r, int g, int b, [int a = 255]) {
    // Pastikan nilai RGB dan alpha berada dalam rentang 0-255
    r = r.clamp(0, 255);
    g = g.clamp(0, 255);
    b = b.clamp(0, 255);
    a = a.clamp(0, 255);
    return img.getColor(r, g, b, a);
  }


  // Fungsi untuk mengonversi nilai RGB ke objek img.Color
  Future<Uint8List> convertCameraImageToBytes(CameraImage image) async {
    // Mengambil width dan height dari CameraImage
    final int width = image.width;
    final int height = image.height;

    // Pastikan width dan height lebih besar dari 0
    if (width <= 0 || height <= 0) {
      throw Exception('Width and height must be greater than zero');
    }

    // Membuat image baru dari CameraImage
    img.Image convertedImage = img.Image(width: width, height: height); // Ukuran asli

    // Mengonversi pixel dari CameraImage ke img.Image
    for (int i = 0; i < height; i++) {
      for (int j = 0; j < width; j++) {
        // Mengambil nilai pixel dari plane Y (luminance)
        final yIndex = i * width + j;
        final y = image.planes[0].bytes[yIndex];

        // Mengambil nilai pixel dari plane U dan V (chrominance)
        final uIndex = (i ~/ 2) * (width ~/ 2) + (j ~/ 2);
        final u = image.planes[1].bytes[uIndex];
        final v = image.planes[2].bytes[uIndex];

        // Mengonversi YUV ke RGB
        int r = (y + 1.402 * (v - 128)).toInt();
        int g = (y - 0.344136 * (u - 128) - 0.714136 * (v - 128)).toInt();
        int b = (y + 1.772 * (u - 128)).toInt();

        // Pastikan nilai RGB berada dalam rentang 0-255
        r = r.clamp(0, 255);
        g = g.clamp(0, 255);
        b = b.clamp(0, 255);

        // Mengatur pixel RGB
        convertedImage.setPixel(j, i, customGetColor(r, g, b, 255)); // 255 untuk alpha
      }
    }

    // Mengonversi image ke format JPEG
    return Uint8List.fromList(img.encodeJpg(convertedImage));
  }

  //panggil load model dan lable
  loadModel() async {
    try {
      interpreter = await Interpreter.fromAsset('assets/model/model.tflite');
      await loadLabels();
      print("Model and labels loaded successfully");
    } catch (e) {
      print("Failed to load model: $e");
    }
  }

//  memuat label dari file dan mengembalikannya sebagai daftar string
  Future<List<String>> loadLabelsFromAsset(String filePath) async {
    try {
      final data = await DefaultAssetBundle.of(context).loadString(filePath);
      print('Labels file content: $data');
      return data.split('\n').where((label) => label.isNotEmpty).toList();
    } catch (e) {
      print('Failed to load labels: $e');
      return [];
    }
  }

//memanggil fungsi tersebut dan menangani hasilnya, mencetak pesan yang sesuai berdasarkan apakah pemuatan berhasil atau tidak.
  loadLabels() async {
    labels = await loadLabelsFromAsset('assets/model/labels.txt');
    if (labels.isEmpty) {
      print('Error: failed to load.');
    } else {
      print('Labels loaded successfully: $labels');
    }
  }

//PREPROSES INPUT DATA
  List<List<List<List<double>>>> preprocess(CameraImage image) {
    final int inputSize = 224;
    final input = List.generate(
        1,
        (_) => List.generate(
            inputSize,
            (_) =>
                List.generate(inputSize, (_) => List.generate(3, (_) => 0.0))));

    // Proses normalisasi dengan resizing
    for (int i = 0; i < inputSize; i++) {
      for (int j = 0; j < inputSize; j++) {
        final yIndex = (i / inputSize * image.height).floor();
        final xIndex = (j / inputSize * image.width).floor();
        final pixelValue = image.planes[0].bytes[yIndex * image.width + xIndex];
        input[0][i][j][0] = pixelValue / 255.0; // Normalisasi
        input[0][i][j][1] = pixelValue / 255.0; // Salin untuk R, G, B
        input[0][i][j][2] = pixelValue / 255.0;
      }
    }

    return input;
  }

  Future<void> uploadImage(
      Uint8List imageBytes, String label, int index, String token) async {
    try {
      // GANTI API SESUAI HP
      final url = 'http://192.168.201.3:8000/api/storeHasil';

      // Membuat request multipart
      var request = http.MultipartRequest('POST', Uri.parse(url));

      // Menambahkan header
      request.headers.addAll({
        'Content-Type': 'multipart/form-data',
        'Authorization':
            'Bearer $token', // Ganti dengan token yang sesuai jika diperlukan
        // Tambahkan header lain sesuai kebutuhan
      });

      // Menambahkan file dan field
      request.files.add(http.MultipartFile.fromBytes('image_face', imageBytes));
      // request.fields['label'] = label; // Uncomment if you need this field
      request.fields['id_ekspresi'] = index.toString();

      // Mengirim request
      var response = await request.send();
      print(response);

      if (response.statusCode == 200) {
        print('Image uploaded successfully');
      } else {
        // Tambahkan log untuk mencetak respons
        final responseString = await response.stream.bytesToString();
        print(
            'Failed to upload image: ${response.statusCode}, Response: $responseString');
        print('Uploading image of size before: ${imageBytes.length} bytes');
      }
    } catch (e) {
      print('Error uploading image: $e');
    }
  }

  @override
  void dispose() {
    cameraController?.dispose();
    interpreter.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Live Emotion Detection ')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width,
                child: cameraController == null ||
                        !cameraController!.value.isInitialized
                    ? Center(child: Text('Camera not initialized'))
                    : AspectRatio(
                        aspectRatio: cameraController!.value.aspectRatio,
                        child: CameraPreview(cameraController!),
                      ),
              ),
            ),
            BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                if (state is LoginLoaded) {

                  return ElevatedButton(
                    onPressed: () {
                      if (cameraImage != null) {
                        // Pastikan cameraImage tidak null
                        runModel(state.model.token);

                      } else {
                        print(
                            'Camera image is still null, please wait for the stream to start.');
                      }
                    },
                    child: Text('Detect Emotion'),
                  );
                } else {
                  return Container(
                    child: Text("Ggagal "),
                  );
                }
              },
            ),
            SizedBox(height: 20),
            Text(
              output,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
