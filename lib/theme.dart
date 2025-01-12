// THEME COLORS
// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

//hapus tagarnya lalu tambahkan 0xff
//BACKGROUND
Color bg_orange = const Color(0xffFC5734);
Color bg_orange2 = const Color(0xffFFC4AD);
Color bg_orange3 = const Color(0xffFFF7F5);
Color bg_blue = const Color(0xffC5EBFC);
Color bg_blue2 = const Color(0xffEAF8FF);

//FONT
Color black = const Color(0xff000000);
Color white = const Color(0xffffffff);
Color ft_orange = const Color(0xffF6571B);

TextStyle large = const TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.bold,
  fontFamily: 'Poppins',
);

TextStyle medium = large.copyWith(fontSize: 16, fontWeight: FontWeight.bold);
TextStyle xmedium = large.copyWith(fontSize: 13, fontWeight: FontWeight.bold);
TextStyle regular = large.copyWith(fontSize: 12, fontWeight: FontWeight.normal);
TextStyle small = large.copyWith(fontSize: 11, fontWeight: FontWeight.w300);
