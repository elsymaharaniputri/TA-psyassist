import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:psyassist_apk/models/request/rq_register.dart';
import 'package:psyassist_apk/models/response/rp_register.dart';

class ApiDataSource {
  Future<RegisterResponseModel> register(RegisterModel registerModel) async {
    try {
      final response = await http.post(
        Uri.parse(
            'http://192.168.201.3:8000/api/register'), // Pastikan "http://" digunakan
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(registerModel),
      );

      if (response.statusCode == 200) {
        // Handle success
        final result =
            RegisterResponseModel.fromJson(jsonDecode(response.body));
        return result;
      } else {
        // Handle server error
        print('ERRORRR: ${response.statusCode} - ${response.body}');
        throw Exception('Failed to register: ${response.statusCode}');
      }
    } catch (e) {
      // Catch other errors, such as network issues
      print('Error occurred during registration: $e');
      rethrow; // Rethrow the exception if it needs to be handled by the caller
    }
  }
}
