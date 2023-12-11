import 'package:fineline_coffee/app/core/theme/text_theme.dart';
import 'package:flutter/material.dart';

import '../utilities/helpers/ui_helpers.dart';
import 'colors.dart';

class AppInputTheme {
  static final inputDecoration = InputDecorationTheme(
    hintStyle: AppTextTheme.textTheme.bodyMedium?.copyWith(
      height: 1.34,
      color: AppColors.grey10,
    ),
    contentPadding: const EdgeInsets.symmetric(vertical: 16),
    isDense: true,
    border: UiHelpers.inputBorder(AppColors.grey20),
    disabledBorder: UiHelpers.inputBorder(AppColors.grey10),
    enabledBorder: UiHelpers.inputBorder(AppColors.grey20),
    focusedBorder: UiHelpers.inputBorder(AppColors.brown20),
    errorBorder: UiHelpers.inputBorder(AppColors.red10),
    focusedErrorBorder: UiHelpers.inputBorder(AppColors.red10),
    errorStyle: AppTextTheme.textTheme.bodyLarge?.copyWith(
      color: AppColors.red10,
    ),
  );
}
