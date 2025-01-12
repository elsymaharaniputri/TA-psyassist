import 'package:flutter/material.dart';
import 'package:psyassist_apk/theme.dart';

class PointMendengar extends StatefulWidget {
  final String title;
  final String nomor;
  final bool? padding;

  const PointMendengar({
    required this.title,
    required this.nomor,
    this.padding = false,
    super.key,
    required int index,
  });

  @override
  State<PointMendengar> createState() => _PointMendengarState();
}

class _PointMendengarState extends State<PointMendengar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: widget.padding == false
            ? const EdgeInsets.symmetric(horizontal: 28)
            : const EdgeInsets.symmetric(horizontal: 0),
        child: Container(
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            leading: Container(
              alignment: Alignment.center,
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), color: bg_orange2),
              child: Text(
                widget.nomor,
                style:
                    regular.copyWith(color: black, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: regular.copyWith(color: black),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        ));
  }
}
