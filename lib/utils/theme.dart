import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFFe81638);
  static const Color grey = Color(0xFF787677);
  static const Color lightGrey = Color(0xFFd9d9d9);
  static const Color black = Color(0xFF131313);
  static const Color middleGrey = Color(0xFFAAACAE);

  static ThemeData get theme => ThemeData(
        primaryColor: primary,
        textTheme: TextTheme(
          displayLarge: TextStyle(
            fontSize: 20,
            color: primary,
            fontWeight: FontWeight.w900,
          ),
          titleLarge: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 36,
          ),
          titleMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
          displaySmall: TextStyle(
            fontSize: 12,
            color: grey,
            fontWeight: FontWeight.w500,
          ),
          titleSmall: TextStyle(
            fontWeight: FontWeight.w300,
            color: middleGrey,
            fontSize: 14,
          ),
          labelSmall: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 12,
            color: grey,
          ),
        ),
      );
}
