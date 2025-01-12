import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:psyassist_apk/bloc/login/login_bloc.dart';
import 'package:psyassist_apk/bloc/register/register_bloc.dart';
import 'package:psyassist_apk/data/dataresource/api_datalogin.dart';
import 'package:psyassist_apk/data/dataresource/api_dataresource.dart';
import './screens/screen.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        // Tambahkan BlocProvider di sini untuk membuat RegisterBloc tersedia di seluruh aplikasi
        BlocProvider(
          create: (context) => RegisterBloc(ApiDataSource()),
        ),
        BlocProvider(
          create: (context) => LoginBloc(ApiDataLoginSource()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home:
          const Screen(), // pastikan kelas Screen ada di screen.dart dan sudah menggunakan const jika memungkinkan
    );
  }
}
