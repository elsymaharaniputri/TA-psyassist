import 'package:flutter/material.dart';
import 'package:psyassist_apk/screens/home.dart';
import 'package:psyassist_apk/widgets/point_mendengar.dart';
import 'package:psyassist_apk/theme.dart';

void dialogStabilisasi(BuildContext context, String nama) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        scrollable: true,
        content: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border:
                  Border.all(color: bg_orange, width: 2), // Border warna oranye
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                //IMAGE
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    alignment: Alignment.topRight,
                    child: Image.asset('assets/images/screen/Idea.png'),
                  ),
                ),
                // TITLE
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Teknik Stabilisasi Emosi",
                          style: medium.copyWith(color: ft_orange),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      const SizedBox(height: 10),
                      //SUB TITLE
                      Text(
                        "Tools yang digunakan untuk menolong seseorang yang membutuhkan .",
                        style: regular.copyWith(color: black),
                        textAlign: TextAlign.start,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Poin Of Stabilisasi Emosi :",
                          style: medium.copyWith(color: ft_orange),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      const SizedBox(height: 10),
                      //SUB TITLE
                      SizedBox(
                        height: 300,
                        child: ListView.builder(
                          // untuk menyesuaikan tinggi ListView dengan kontennya dan menghindari masalah scroll di dalam Column.
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            final ListPoint = [
                              {
                                'nomor': '1',
                                'title': ' Memberikan ketenangan pada klien',
                              },
                              {
                                'nomor': '2',
                                'title':
                                    'Mengarahkan klien yang kewalahan atau bingung secara emosional',
                              },
                              {
                                'nomor': '3',
                                'title':
                                    'Mengurangi dampak stres, stress healing',
                              },
                            ];

                            return PointMendengar(
                              title: ListPoint[index]['title'] as String,
                              nomor: ListPoint[index]['nomor'] as String,
                              index: index,
                              padding: true,
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 30),
                      //BUTTON
                      Container(
                        alignment: Alignment.centerLeft,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            // padding: EdgeInsets.symmetric(
                            //     vertical: 20.0, horizontal: 55.0),
                            backgroundColor: bg_orange,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Home()));
                          },
                          child: Text("Close",
                              style: xmedium.copyWith(color: white)),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}
