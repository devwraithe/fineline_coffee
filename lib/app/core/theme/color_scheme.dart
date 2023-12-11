import 'package:flutter/material.dart';

import 'colors.dart';

@immutable
class AppColorScheme {
  static ColorScheme lightColorScheme = const ColorScheme.light(
    primary: AppColors.brown20,
    secondary: AppColors.brown30,
    tertiary: AppColors.black10,
    background: AppColors.white10,
  );
}
