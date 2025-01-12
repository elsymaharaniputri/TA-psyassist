import 'package:flutter/material.dart';
import 'package:psyassist_apk/screens/login.dart';
import 'package:psyassist_apk/theme.dart';
// import 'home.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});
  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    final mywidth = MediaQuery.of(context).size.width;
    final myheight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.all(8.0), // Atur margin sesuai kebutuhan
          child:
              Image.asset('assets/images/logo/logo.png'), // Image on the left
        ),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            const SizedBox(height: 150),
            // LOGO
            SizedBox(
              height: myheight * 0.3,
              width: mywidth * 0.5,
              child: Image.asset(
                'assets/images/screen/scc2.png',
                fit: BoxFit.contain,
              ),
            ),
            // TEXT
            Text(
              'Tingkatkan Dukungan Anda Dengan Aplikasi PsyAssist (App Psychological First Aid )!',
              textAlign: TextAlign.start,
              style: medium.copyWith(color: ft_orange),
            ),
            const SizedBox(height: 20),
            // TEXT
            Text(
              'Aplikasi ini menyediakan panduan lengkap, materi interaktif, dan tips praktis yang dapat Anda akses kapan saja.',
              textAlign: TextAlign.start,
              style: regular.copyWith(color: black),
            ),
            const SizedBox(height: 50),

            //BUTTON
            Container(
              alignment: Alignment.centerLeft,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 20.0, horizontal: 55.0),
                  backgroundColor: bg_orange,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child:
                    Text("Get Started", style: xmedium.copyWith(color: white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
