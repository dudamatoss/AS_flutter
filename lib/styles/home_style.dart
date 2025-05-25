import 'package:flutter/material.dart';

class HomeStyles {
  static const Color primaryColor = Color(0xFF3C506E);
  static const Color secondaryColor = Color(0xFF88A3CC);
  static const Color boxColor = Color(0xFF5F8CAF);
  static const Color infoColor = Color(0xFFFFFFFF);

  static const TextStyle appBar = TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.bold,
  color: Colors.white,
  );

  static const TextStyle countryName = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static BoxDecoration cardBoxDecoration = BoxDecoration(
    color: boxColor,
    borderRadius: BorderRadius.circular(12)
  );

  static const TextStyle detailText = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w900,
    color: Colors.white,
  );

}