import 'package:flutter/material.dart';

class ResponsiveUi {
  static late double sizeWith;
  static late double sizeHeith;
  static late double textHeith;
  static late double textcontraints;

  void init(BoxConstraints constraints) {
    textcontraints = constraints.maxWidth / 100;

    if (constraints.maxWidth <= 900) {
      textHeith = constraints.maxWidth / 65;
    } else {
      textHeith = 16;
      textcontraints = constraints.maxWidth / 90;
    }

    // textHeith = 16;

    // print('constraints.maxHeight :${constraints.maxHeight}');
    // print('constraints.minHeight :${constraints.minHeight}');
    // print(' constraints.maxWidth : ${constraints.maxWidth}');
    // print(' constraints.minWidth :${constraints.minWidth}');
  }

  // pantalal grande
  // maxheith 800
  // max with 1600
}
