import 'package:fineline_coffee/app/core/theme/text_theme.dart';
import 'package:flutter/material.dart';

import '../utilities/helpers/constants.dart';
import 'colors.dart';

@immutable
class AppButtonTheme {
  static final buttonTheme = ButtonThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5.0),
    ),
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    buttonColor: AppColors.brown20,
  );

  // Filled button
  static final filledButtonTheme = FilledButtonThemeData(
    style: AppButtonTheme.filledButtonStyle,
  );
  static final filledButtonStyle = FilledButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(
        Constants.buttonRadius,
      ),
    ),
    textStyle: AppTextTheme.textTheme.titleMedium?.copyWith(
      fontFamily: Constants.fontFamily,
      color: AppColors.white10,
      fontWeight: FontWeight.w500,
      letterSpacing: 2,
    ),
    side: const BorderSide(
      color: AppColors.brown20,
      width: 1.4,
      strokeAlign: BorderSide.strokeAlignCenter,
    ),
    backgroundColor: AppColors.brown20,
    minimumSize: const Size(double.infinity, 56),
  );

  // Outlined button theming
  static final outlinedButtonTheme = OutlinedButtonThemeData(
    style: AppButtonTheme.outlinedButtonStyle,
  );
  static final outlinedButtonStyle = OutlinedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(
        Constants.buttonRadius,
      ),
    ),
    textStyle: AppTextTheme.textTheme.titleMedium?.copyWith(
      fontFamily: Constants.fontFamily,
      color: AppColors.brown20,
      fontWeight: FontWeight.w500,
      letterSpacing: 2,
    ),
    side: const BorderSide(
      color: AppColors.brown20,
      width: 1.4,
      strokeAlign: BorderSide.strokeAlignCenter,
    ),
    minimumSize: const Size(double.infinity, 54),
  );
}
