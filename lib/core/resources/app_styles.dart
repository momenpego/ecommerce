import 'package:flutter/material.dart';

class AppStyles {
 static TextStyle headline1({required double height, Color? color}) {
    return TextStyle(
        fontSize: height * 0.03,
        color: color ?? Colors.black,
        fontWeight: FontWeight.w500);
  }
   static TextStyle headline2({required double height, Color? color}) {
    return TextStyle(
        fontSize: height * 0.025,
        color: color ?? Colors.black,
        fontWeight: FontWeight.w500);
  }

   static TextStyle bottom({required double height}) {
    return TextStyle(
        fontSize: height * 0.025,
        color: Colors.white,
        fontWeight: FontWeight.bold);
  }

  static TextStyle smallCaptions({required double height, Color? color}) {
    return TextStyle(
        fontSize: height * 0.018,
        color: color ?? Colors.black,
        fontWeight: FontWeight.w500);
  }
}
