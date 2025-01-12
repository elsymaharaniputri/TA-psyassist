import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:psyassist_apk/screens/home.dart';
import 'package:psyassist_apk/widgets/point_panduan.dart';
import 'package:psyassist_apk/theme.dart';

class PanduanSelfie extends StatefulWidget {
  const PanduanSelfie({super.key});

  @override
  State<PanduanSelfie> createState() => _PanduanSelfieState();
}

class _PanduanSelfieState extends State<PanduanSelfie> {
  @override
  Widget build(BuildContext context) {
    // INITIAL TINGGI DAN LEBAR
    final mywidth = MediaQuery.of(context).size.width;
    final myheight = MediaQuery.of(context).size.height;

    return Scaffold(
        // APPBAR
        appBar: AppBar(
          title: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Panduan ',
                  style: medium.copyWith(color: black),
                ),
              ],
            ),
          ),
          centerTitle: true,

          // BACK
          leading: Container(
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              border: Border.all(color: black, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => const Home()));
              },
            ),
          ),
        ),

        //PANDUAN
        body: SingleChildScrollView(
            child: Column(children: [
          // TITLE
          const SizedBox(height: 30),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Text(
              "Panduan  Pose Foto",
              style: xmedium.copyWith(color: ft_orange),
            ),
          ),
          const SizedBox(height: 10),
          // TEXT

          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Text(
              "Anda dapat ikuti beberapa model pose yang ada, jika sesuai dengan perasaan saat ini untuk mendapatkan hasil maksimal",
              style: regular.copyWith(color: black),
              textAlign: TextAlign.justify,
            ),
          ),
          const SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.maxFinite,
                        child: Image.asset(
                          'assets/images/panduan/stress.png',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Image.asset(
                          'assets/images/panduan/sedih.png',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Image.asset(
                          'assets/images/panduan/cemas.png',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Image.asset(
                          'assets/images/panduan/takut.png',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
        ])));
  
  }
}
