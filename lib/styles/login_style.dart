import 'package:flutter/material.dart';
import 'screens_style.dart';

class LoginStyles {
  static const EdgeInsets pagePadding = EdgeInsets.symmetric(horizontal: 32);
  static const double logoHeight = 100;
  static const SizedBox topSpacing = SizedBox(height: 40);
  static const SizedBox fieldSpacing = SizedBox(height: 20);
  static const SizedBox buttonSpacing = SizedBox(height: 30);

  static const TextStyle inputText = TextStyle(color: Colors.white);
  static const TextStyle hintText = TextStyle(color: Colors.white70);

  static const double borderRadius = 12;

  static InputDecoration _baseDecoration(
      String hint,
      IconData icon,
      Color fillColor,
      ) {
    return InputDecoration(
      hintText: hint,
      hintStyle: hintText,
      filled: true,
      fillColor: fillColor,
      prefixIcon: Icon(icon, color: Colors.white70),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: const BorderSide(color: Colors.white, width: 1.5),
      ),
    );
  }

  static InputDecoration emailDecoration(Color fillColor) {
    return _baseDecoration('E-mail', Icons.email, fillColor);
  }

  static InputDecoration passwordDecoration(Color fillColor) {
    return _baseDecoration('Senha', Icons.lock, fillColor);
  }

  static InputDecoration nameDecoration(Color fillColor) {
    return _baseDecoration('Nome', Icons.person, fillColor);
  }

  static ButtonStyle loginButton = ElevatedButton.styleFrom(
    backgroundColor: HomeStyles.primaryColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );

  static const TextStyle buttonText = TextStyle(
    color: Colors.white,
    fontSize: 16,
  );

  static const TextStyle bottomText = TextStyle(
    fontSize: 18,
    color: Colors.white70,
  );

  static TextStyle registerLink(Color color) => const TextStyle(
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.underline,
  ).copyWith(color: color);
}