// File: resources/api_data_source.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:psyassist_apk/models/request/rq_login.dart';
import 'package:psyassist_apk/models/response/rp_login.dart';

/* 
Mengirimkan permintaan HTTP POST ke API login dengan data yang dikirim dalam format JSON.
Jika respons berhasil (status 200), ia mengonversi respons JSON menjadi objek LoginResponseModel dan mengembalikannya.
Jika respons gagal, ia melemparkan pengecualian dengan pesan kesalahan yang relevan.*/

class ApiDataLoginSource {
  Future<LoginResponseModel> login(LoginRequestModel request) async {
    try {
      /* http.post adalah metode untuk mengirimkan permintaan POST ke API dgn parameter : URL,BODY,HEADER*/
      final response = await http.post(
        Uri.parse('http://192.168.201.3:8000/api/login'),
        body: jsonEncode(request.toJson()),
        headers: {'Content-Type': 'application/json'},
        // headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        // Handle success
        final result = LoginResponseModel.fromJson(jsonDecode(response.body));
        return result;
      } else {
        // Handle server error
        print('ERRORRR: ${response.statusCode} - ${response.body}');
        throw Exception('Failed to login: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred during login: $e');
      rethrow;
    }
  }
}
