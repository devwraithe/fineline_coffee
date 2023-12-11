import 'package:another_flushbar/flushbar.dart';
import 'package:fineline_coffee/app/core/theme/text_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

import '../../theme/colors.dart';
import 'constants.dart';

class UiHelpers {
  // Buttons

  // Inputs
  static inputField(String title, Widget field) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextTheme.textTheme.bodyLarge?.copyWith(
            color: AppColors.grey10,
          ),
        ),
        const SizedBox(height: 12),
        field,
      ],
    );
  }

  // Theme
  static inputBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(Constants.inputRadius),
      borderSide: BorderSide(
        color: color,
        width: 1.24,
      ),
    );
  }

  static inputDecoration() {
    return InputDecoration(
      prefix: Constants.prefixSpace,
    );
  }

  static switchPassword(
    void Function()? onTap,
    bool obscurePassword,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        obscurePassword == true ? TablerIcons.eye_off : TablerIcons.eye,
      ),
    );
  }

  // Notifications
  static loader() {
    return const CupertinoActivityIndicator(
      color: AppColors.white,
    );
  }

  static errorFlush(
    String message,
    BuildContext context,
  ) async {
    return Flushbar(
      messageText: Text(
        message,
        textAlign: TextAlign.center,
        style: AppTextTheme.textTheme.bodyLarge?.copyWith(
          color: AppColors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
      duration: const Duration(seconds: 2),
      backgroundColor: AppColors.red10,
      flushbarPosition: FlushbarPosition.BOTTOM,
      blockBackgroundInteraction: true,
      padding: const EdgeInsets.fromLTRB(20, 22, 20, 18),
    )..show(context);
  }
}
