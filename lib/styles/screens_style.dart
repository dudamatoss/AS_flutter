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
    borderRadius: BorderRadius.circular(12),
  );

  static const TextStyle detailText = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w900,
    color: Colors.white,
  );

  static const TextStyle errorText = TextStyle(
    color: Colors.white,
  );

  static const TextStyle emptyText = TextStyle(
    color: Colors.white,
  );

  static const EdgeInsets cardPadding = EdgeInsets.all(10);
  static const EdgeInsets listPadding = EdgeInsets.all(15);
  static const SizedBox listSeparator = SizedBox(height: 25);
  static const EdgeInsets imagePadding = EdgeInsets.only(right: 12);

  static const double imageWidth = 50;
  static const double imageHeight = 50;

  static const EdgeInsets listTileContentPadding = EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 12,
  );

  //estilização para a page de detalhes doa paises
  static const EdgeInsets detailPadding = EdgeInsets.all(16);
  static const double detailImageHeight = 200;
  static const double detailTitleFontSize = 24;
  static const EdgeInsets cardInnerPadding = EdgeInsets.all(12);
  static const EdgeInsets cardMargin = EdgeInsets.symmetric(vertical: 8);

}
