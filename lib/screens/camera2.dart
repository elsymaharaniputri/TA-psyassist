import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';

class Camera2 extends StatefulWidget {
  const Camera2({super.key});

  @override
  State<Camera2> createState() => _Camera2State();
}

class _Camera2State extends State<Camera2> {
  bool _loading = true; // Menandakan apakah model sedang memproses
  File? _image; // Menyimpan gambar yang diambil
  List? _output; // Menyimpan hasil deteksi
  final picker = ImagePicker(); // Instance untuk mengambil gambar

  @override
  void initState() {
    super.initState();
    loadModel().then((value) {
      setState(() {});
    });
  }

  // Fungsi untuk mendeteksi gambar
  detectImage(File image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 2,
      threshold: 0.6,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _output = output; // Menyimpan hasil deteksi
      _loading = false; // Mengubah status loading
    });
  }

  // Fungsi untuk memuat model TFLite
  loadModel() async {
    await Tflite.loadModel(
      model: 'assets/model/model.tflite',
      labels: 'assets/model/labels.txt',
    );
  }

  @override
  void dispose() {
    Tflite.close(); // Menutup model saat widget dibuang
    super.dispose();
  }

  // Fungsi untuk mengambil gambar dari kamera
  pickImage() async {
    var image = await picker.pickImage(source: ImageSource.camera);
    if (image == null) return; // Jika tidak ada gambar yang diambil, keluar dari fungsi

    // Mendapatkan direktori untuk menyimpan gambar
    final directory = await getApplicationDocumentsDirectory();
    final String path = '${directory.path}/images'; // Folder untuk menyimpan gambar

    // Membuat folder jika belum ada
    final Directory folder = Directory(path);
    if (!await folder.exists()) {
      await folder.create(recursive: true);
    }

    // Menyimpan gambar ke folder
    final String imagePath = '$path/${DateTime.now().millisecondsSinceEpoch}.jpg';
    File(image.path).copy(imagePath).then((value) {
      setState(() {
        _image = value; // Menyimpan gambar yang disalin
        _loading = true; // Set loading ke true saat gambar diambil
      });
      detectImage(_image!); // Memanggil fungsi deteksi gambar
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Object Detection'),
      ),
      body: Center(
        child: _loading
            ? const CircularProgressIndicator() // Menampilkan indikator loading
            : _image == null
            ? const Text('No image selected.') // Jika tidak ada gambar
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.file(_image!), // Menampilkan gambar yang diambil
            const SizedBox(height: 20),
            _output != null && _output!.isNotEmpty
                ? Text(
              'Detected: ${_output![0]['label']}', // Menampilkan label hasil deteksi
              style: const TextStyle(fontSize: 20),
            )
                : const Text('No detection results.'), // Jika tidak ada hasil deteksi
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: pickImage, // Memanggil fungsi untuk mengambil gambar
        tooltip: 'Pick Image',
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}