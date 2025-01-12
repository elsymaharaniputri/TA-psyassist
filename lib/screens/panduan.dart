
import 'package:flutter/material.dart';
import 'package:psyassist_apk/screens/camera.dart';
import 'package:psyassist_apk/screens/camera2.dart';

import 'package:psyassist_apk/screens/home.dart';
import 'package:psyassist_apk/screens/panduan-selfie.dart';
import 'package:psyassist_apk/screens/rekomendasi.dart';

import 'package:psyassist_apk/widgets/point_panduan.dart';
import 'package:psyassist_apk/theme.dart';

class Panduan extends StatefulWidget {
  const Panduan({super.key});

  @override
  State<Panduan> createState() => _PanduanState();
}

class _PanduanState extends State<Panduan> {
  @override
  Widget build(BuildContext context) {
    // INITIAL TINGGI DAN LEBAR

    final ListPanduan = [
      {
        'nomor': '1',
        'title': 'Pilih panduan pose foto ',
        'icon': const Icon(Icons.navigate_next_rounded),
        'nextpage': const PanduanSelfie(),
      },
      {
        'nomor': '2',
        'title': 'Klik Icon dan berfoto ',
        'icon': const Icon(Icons.camera_alt_outlined),
        'nextpage': const CameraScreen(),
      },
      {
        'nomor': '3',
        'title': 'Dapatkan rekomendasi audio relax',
        'icon': const Icon(Icons.navigate_next_rounded),
        'nextpage': const Rekomendasi(),
      },
    ];
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Home()));
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
              "Panduan  Deteksi Emosi",
              style: xmedium.copyWith(color: ft_orange),
            ),
          ),
          const SizedBox(height: 10),
          // TEXT

          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Text(
              "Ikuti langkah - langkah berikut dengan urut agar mendapatkan rekomendasi audio relax yang sesuai",
              style: regular.copyWith(color: black),
              textAlign: TextAlign.justify,
            ),
          ),
          const SizedBox(height: 10),
          ListView.builder(
            // untuk menyesuaikan tinggi ListView dengan kontennya dan menghindari masalah scroll di dalam Column.
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),

            itemBuilder: (context, index) {
              return PointPanduan(
                nomor: ListPanduan[index]['nomor'] as String,
                title: ListPanduan[index]['title'] as String,
                icon: ListPanduan[index]['icon'] as Icon,
                nextpage: ListPanduan[index]['nextpage'] as Widget,
                index: index,
              );
            },
            itemCount: ListPanduan.length,
          ),
        ])));
  }
}
