import 'package:flutter/material.dart';
import 'package:psyassist_apk/theme.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

void dialogRating(BuildContext context, String nama) {
  double rating = 0; // Variabel untuk menyimpan nilai rating
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        scrollable: true,
        content: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            padding: const EdgeInsets.only(
                left: 10.0, right: 10.0, top: 10.0, bottom: 30.0),
            width: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border:
                  Border.all(color: bg_orange, width: 2), // Border warna oranye
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                // IMAGE
                Align(
                  alignment: Alignment.topRight,
                  child: Image.asset('assets/images/rekomendasi/rating.png'),
                ),
                // TITLE
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Rating Audio ",
                        style: medium.copyWith(color: ft_orange),
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(height: 10),
                      // SUB TITLE
                      Text(
                        "Apakah anda terbantu dengan audio ini?",
                        style: regular.copyWith(color: black),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Pemberian rate dimulai dari skala 3-1 dengan kepuasan (tidak puas - sangat puas)",
                        style: regular.copyWith(color: black),
                      ),
                      const SizedBox(height: 10),

                      // RATING
                      RatingBar.builder(
                        minRating: 1,
                        itemSize: 30.0,
                        itemCount: 3,
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (newRating) {
                          rating = newRating; // Update nilai rating
                        },
                      ),
                      const SizedBox(height: 10),

                    
                      // BUTTON
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: bg_orange,
                        ),
                        onPressed: () {
                          // Lakukan sesuatu dengan nilai rating
                          print("Rating dikirim: $rating");
                          Navigator.pop(context); // Tutup dialog
                        },
                        child: Text(
                          "Kirim",
                          style: xmedium.copyWith(color: white),
                        ),
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
