import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:psyassist_apk/theme.dart';

class StabilisasiMenu extends StatefulWidget {
  final String title;
  final String subtitle1;
  final String? subtitle2;
  final String? subtitle3;
  final String? subtitle4;
  final String? image;
  final Color bg_color;
  final Color ft_color;
  final Color title_color;

  const StabilisasiMenu(
      {required this.title,
      required this.subtitle1,
      this.subtitle2,
      this.subtitle3,
      this.subtitle4,
      this.image,
      required this.bg_color,
      required this.ft_color,
      required this.title_color,
      super.key,
      required int index});

  @override
  State<StabilisasiMenu> createState() => Stabilisasi_MenuState();
}

class Stabilisasi_MenuState extends State<StabilisasiMenu> {
  @override
  Widget build(BuildContext context) {
    // INITIAL TINGGI DAN LEBAR
    final mywidth = MediaQuery.of(context).size.width;

    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
        width: mywidth * 0.4,
        // height: myheight * 0.28,
        decoration: BoxDecoration(
          color: widget.bg_color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 0),
                    child: Text(widget.title,
                        style: regular.copyWith(
                          color: widget.title_color,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left),
                  )),
              Image.asset(widget.image!),
            ],
          ),
          const SizedBox(height: 20),
          Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("• "),
                      Expanded(
                        child: Text(
                          widget.subtitle1,
                          style: regular.copyWith(color: widget.ft_color),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ]),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("• "),
                      Expanded(
                        child: Text(
                          widget.subtitle2!,
                          style: regular.copyWith(color: widget.ft_color),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ]),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("• "),
                      Expanded(
                        child: Text(
                          widget.subtitle3!,
                          style: regular.copyWith(color: widget.ft_color),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ]),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      widget.subtitle4! == "" ? const Text("") : const Text("• "),
                      Expanded(
                        child: Text(
                          widget.subtitle4!,
                          style: regular.copyWith(color: widget.ft_color),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ]),
              ),
            ],
          ),
        ]));
  }
}
