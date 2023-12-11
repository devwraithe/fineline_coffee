import 'package:fineline_coffee/app/core/theme/text_theme.dart';
import 'package:flutter/material.dart';

import '../utilities/helpers/constants.dart';
import 'button_theme.dart';
import 'color_scheme.dart';
import 'input_theme.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: Constants.fontFamily,
    colorScheme: AppColorScheme.lightColorScheme,
    buttonTheme: AppButtonTheme.buttonTheme,
    scaffoldBackgroundColor: AppColorScheme.lightColorScheme.background,
    textTheme: AppTextTheme.textTheme,
    inputDecorationTheme: AppInputTheme.inputDecoration,
    filledButtonTheme: AppButtonTheme.filledButtonTheme,
    outlinedButtonTheme: AppButtonTheme.outlinedButtonTheme,
  );
}
