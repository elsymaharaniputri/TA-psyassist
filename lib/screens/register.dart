import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:psyassist_apk/bloc/register/register_bloc.dart';
import 'package:psyassist_apk/models/request/rq_register.dart';
import 'package:psyassist_apk/screens/login.dart';
import 'package:psyassist_apk/theme.dart';
// import 'home.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
  var _obscureText = true;

  Register({super.key});
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final nameField = TextEditingController();
  final usernameField = TextEditingController();
  final passwordField = TextEditingController();
  final roleField = TextEditingController();
  final birthDateField = TextEditingController();

  final bool _obscureText = true;
  String? _selectedRole;

  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        controller.text = "${picked.year}-${picked.month}-${picked.day}";
      });
    }
  }

  @override
  void dispose() {
    nameField.dispose();
    usernameField.dispose();
    passwordField.dispose();
    birthDateField.dispose();
    roleField.dispose();

    super.dispose();
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
              height: myheight * 0.5,
              width: mywidth * 0.5,
              child: Image.asset(
                'assets/images/logo/logo3.png',
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 50),

            // LOGIN
            Container(
              child: Text(
                'Join Us !',
                style: large.copyWith(color: ft_orange),
                textAlign: TextAlign.left,
              ),
            ),

            // TEXT
            Text(
              'Lakukan registrasi sebelum login',
              textAlign: TextAlign.left,
              style: regular.copyWith(color: black),
            ),
            const SizedBox(height: 50),

            // USERNAME
            Text(
              'Nama Lengkap',
              textAlign: TextAlign.left,
              style: regular.copyWith(color: black),
            ),
            const SizedBox(height: 5),

            // TEXT FIELD USERNAME
            TextFormField(
              controller: nameField,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 14.0, horizontal: 12.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(color: bg_orange),
                ),
                label: Text(
                  "isikan nama lengkap",
                  style: small,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // ROLE
            Text(
              'Pilih Role',
              textAlign: TextAlign.left,
              style: small.copyWith(color: black),
            ),
            const SizedBox(height: 5),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 14.0, horizontal: 12.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: const BorderSide(color: Colors.lightBlueAccent),
                ),
              ),
              value: _selectedRole,
              hint: const Text("Pilih Role"),
              items: const [
                DropdownMenuItem(value: "1", child: Text("Relawan")),
                DropdownMenuItem(value: "2", child: Text("Penyintas")),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedRole = value;
                  if (value != null) {
                    roleField.text = value;
                  }
                });
              },
            ),

            const SizedBox(height: 20),
            // Tanggal Lahir
            Text(
              'Tanggal Lahir',
              textAlign: TextAlign.left,
              style: small.copyWith(color: black),
            ),
            const SizedBox(height: 5),
            // TEXT FIELD Tanggal Lahir
            TextFormField(
              controller: birthDateField,
              readOnly: true,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 14.0, horizontal: 12.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: const BorderSide(color: Colors.lightBlueAccent),
                ),
                label: Text("Isikan tanggal lahir", style: small),
              ),
              onTap: () => _selectDate(context, birthDateField),
            ),
            const SizedBox(height: 20),
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
              child: BlocConsumer<RegisterBloc, RegisterState>(
                listener: (context, state) {
                  if (state is RegisterLoaded) {
                    nameField.clear();
                    usernameField.clear();
                    passwordField.clear();
                    birthDateField.clear();
                    roleField.clear();
                    // Successful registration handling (unchanged)
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Registrasi berhasil!'),
                        backgroundColor: Colors.green,
                        duration: Duration(seconds: 2),
                      ),
                    );

                    Future.delayed(const Duration(seconds: 2), () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    });
                  } else if (state is RegisterError) {
                    // Registration error handling (unchanged)
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Registrasi gagal: ${state.message}'),
                        backgroundColor: Colors.red,
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return TextButton(
                    onPressed: () {
                      final name = nameField.text
                          .trim(); // Trim leading/trailing whitespace
                      final username = usernameField.text.trim();
                      final password = passwordField.text.trim();
                      final birthDateText = birthDateField.text;
                      final selectedRole = roleField.text;

                      // Validate all fields
                      if (name.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Nama tidak boleh kosong'),
                            backgroundColor: Colors.red,
                            duration: Duration(seconds: 2),
                          ),
                        );
                        return; // Prevent further processing if name is empty
                      }

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

                      if (birthDateText.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Tanggal lahir tidak boleh kosong'),
                            backgroundColor: Colors.red,
                            duration: Duration(seconds: 2),
                          ),
                        );
                        return;
                      }

                      if (selectedRole.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Pilih role Anda'),
                            backgroundColor: Colors.red,
                            duration: Duration(seconds: 2),
                          ),
                        );
                        return;
                      }

                      // Date parsing (assuming valid format)
                      final parts = birthDateText.split('-');
                      final birthDate = DateTime(
                        int.parse(parts[0]),
                        int.parse(parts[1]),
                        int.parse(parts[2]),
                      );

                      // Create request model
                      final requestModel = RegisterModel(
                        name: name,
                        username: username,
                        password: password,
                        tglLahir: birthDate,
                        idRole: selectedRole,
                      );

                      // Dispatch SaveRegisterEvent
                      context
                          .read<RegisterBloc>()
                          .add(SaveRegisterEvent(request: requestModel));
                    },
                    child: Text(
                      "Daftar",
                      style: small.copyWith(color: ft_orange),
                    ),
                  );
                },
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Anda sudah punya akun?',
                  style: small.copyWith(color: Colors.black),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: Text(
                    "Login",
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
