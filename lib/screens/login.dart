import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:psyassist_apk/bloc/login/login_bloc.dart';
import 'package:psyassist_apk/models/request/rq_login.dart';
import 'package:psyassist_apk/screens/register.dart';
import 'package:psyassist_apk/screens/home.dart';
import 'package:psyassist_apk/theme.dart';
// import 'home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
  var _obscureText = true;

  LoginPage({super.key});
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final usernameField = TextEditingController();
  final passwordField = TextEditingController();
  final usernameFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  String? _selectedGender;

  @override
  void dispose() {
    usernameField.dispose();
    passwordField.dispose();
    super.dispose();
  }

  void _unfocusAllFields() {
    usernameFocusNode.unfocus();
    passwordFocusNode.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    final mywidth = MediaQuery.of(context).size.width;
    final myheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            const SizedBox(height: 150),
            // LOGO
            SizedBox(
              height: myheight * 0.2,
              width: mywidth * 0.2,
              child: Image.asset(
                'assets/images/logo/logo2.png',
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 10),

            // LOGIN
            Container(
              child: Center(
                child: Text(
                  'Welcome Back',
                  style: large.copyWith(color: ft_orange),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            // TEXT
            Text(
              'Login ke akun anda sekarang',
              textAlign: TextAlign.center,
              style: regular.copyWith(color: black),
            ),
            const SizedBox(height: 50),

            // USERNAME
            Text(
              'Username',
              textAlign: TextAlign.left,
              style: regular.copyWith(color: black),
            ),
            const SizedBox(height: 5),
            // TEXT FIELD USERNAME
            TextFormField(
              controller: usernameField,
              focusNode: usernameFocusNode,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 14.0, horizontal: 12.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(color: bg_orange),
                ),
                label: Text(
                  "isikan username registrasi",
                  style: small,
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Username tidak boleh kosong';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            // PASSWORD
            Text(
              'Password',
              textAlign: TextAlign.left,
              style: small.copyWith(color: black),
            ),
            const SizedBox(height: 5),
            // TEXT FIELD PASSWORD
            TextFormField(
              controller: passwordField,
              focusNode: passwordFocusNode,
              obscureText: widget._obscureText,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 14.0, horizontal: 12.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(color: bg_orange),
                ),
                label: Text(
                  "isikan password registrasi",
                  style: small,
                ),
                suffixIcon: IconButton(
                  icon: Icon(widget._obscureText
                      ? Icons.visibility
                      : Icons.visibility_off),
                  color: bg_orange,
                  onPressed: () {
                    setState(() {
                      widget._obscureText = !widget._obscureText;
                    });
                  },
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Password tidak boleh kosong';
                }
                return null;
              },
            ),

            const SizedBox(height: 40),

            // BUTTON
            SizedBox(
              width: mywidth,
              child: BlocConsumer<LoginBloc, LoginState>(
                listener: (context, state) {
                  if (state is LoginLoading) {
                    // Menampilkan indikator loading (misalnya snackbar atau dialog)
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Logging in...'),
                        backgroundColor: Colors.blue,
                        duration: Duration(seconds: 2),
                      ),
                    );
                  } else if (state is LoginLoaded) {
                    // Jika login berhasil
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Login successful!'),
                        backgroundColor: Colors.green,
                        duration: Duration(seconds: 2),
                      ),
                    );

                    // Navigasi ke halaman berikutnya
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Home()),
                    );
                  } else if (state is LoginError) {
                    // Jika login gagal
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.message), // Pesan error dari state
                        backgroundColor: Colors.red,
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: ft_orange,
                    ),
                    onPressed: () {
                      final username = usernameField.text.trim();
                      final password = passwordField.text.trim();

                      if (username.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Username tidak boleh kosong'),
                            backgroundColor: Colors.red,
                            duration: Duration(seconds: 2),
                          ),
                        );
                        return;
                      }

                      if (password.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Password tidak boleh kosong'),
                            backgroundColor: Colors.red,
                            duration: Duration(seconds: 2),
                          ),
                        );
                        return;
                      }

                      // Create request model
                      final requestModel = LoginRequestModel(
                        username: username,
                        password: password,
                      );

                      // Dispatch SaveLoginEvent
                      context
                          .read<LoginBloc>()
                          .add(SaveLoginEvent(request: requestModel));
                    },
                    child: state is LoginLoading
                        ? const CircularProgressIndicator(
                            color: Colors
                                .white) // Tampilkan loading jika sedang memproses
                        : Text(
                            "Log In",
                            style: small.copyWith(color: Colors.white),
                          ),
                  );
                },
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Anda belum mendaftar!',
                  style: small.copyWith(color: Colors.black),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Register()),
                    );
                  },
                  child: Text(
                    "Register",
                    style: small.copyWith(color: ft_orange),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
