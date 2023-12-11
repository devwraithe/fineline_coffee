import 'package:flutter/material.dart';

@immutable
class AppTextTheme {
  static const textTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: 60,
      fontWeight: FontWeight.w100,
      fontFamily: "Canela",
      height: 1.5,
    ),
    displayMedium: TextStyle(
      fontSize: 41.05,
    ),
    displaySmall: TextStyle(
      fontSize: 38,
      fontWeight: FontWeight.w100,
      fontFamily: "Canela",
      // height: 1.5,
    ),
    headlineLarge: TextStyle(
      fontSize: 26,
    ),
    headlineMedium: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w700,
    ),
    headlineSmall: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
    ),
    titleLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
    ),
    titleMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w700,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
  );
}
