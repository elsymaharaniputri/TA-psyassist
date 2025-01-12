import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:psyassist_apk/screens/home.dart';
import 'package:psyassist_apk/widgets/dialog_audio.dart';
import 'package:psyassist_apk/widgets/point_audio.dart';
import 'package:psyassist_apk/theme.dart';

class Rekomendasi extends StatefulWidget {
  const Rekomendasi({super.key});

  @override
  State<Rekomendasi> createState() => _RekomendasiState();
}

class _RekomendasiState extends State<Rekomendasi> {
  @override
  Widget build(BuildContext context) {
    // INITIAL LIST AUDI
    final List<Map<String, dynamic>> listAudio = [
      {
        'title': 'Deep Breathing ',
        'icon': const Icon(Icons.play_circle_filled_rounded),
        'nextpage': const AudioPlayerWidget(),
      },
      {
        'title': 'Squere Breathing ',
        'icon': const Icon(Icons.play_circle_filled_rounded),
        'nextpage': const AudioPlayerWidget(),
      },
      {
        'title': 'Grounding',
        'icon': const Icon(Icons.play_circle_filled_rounded),
        'nextpage': const AudioPlayerWidget(),
      },
    ];
    return Scaffold(
        // APPBAR
        appBar: AppBar(
          title: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Rekomendasi ',
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

        //REKOMENDASI
        body: SingleChildScrollView(
            child: Column(children: [
          // PENJELASAN REKOMENDASI
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //image
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(left: 28.0, right: 10.0),
                width: 100,
                height: 100,
                child: Image.asset(
                  'assets/images/rekomendasi/Afraid.png',
                  fit: BoxFit.cover,
                ),
              ),
              //Text
              Expanded(
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(right: 28.0),
                  child: Text(
                    "Ikuti langkah - langkah berikut dengan urut agar mendapatkan rekomendasi audio relax yang sesuai",
                    style: regular.copyWith(color: black),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          // TITLE
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Text(
              "Rekomendasi Audio Relax",
              style: xmedium.copyWith(color: ft_orange),
            ),
          ),
          const SizedBox(height: 10),

          // LIST AUDIO
          ListView.builder(
            // untuk menyesuaikan tinggi ListView dengan kontennya dan menghindari masalah scroll di dalam Column.
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return PointAudio(
                title: listAudio[index]['title'] as String,
                icon: listAudio[index]['icon'] as Icon,
                nextpage: listAudio[index]['nextpage'] as Widget,
                index: index,
              );
            },
            itemCount: listAudio.length,
          ),
        ])));
  }
}
