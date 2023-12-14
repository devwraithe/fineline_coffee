import 'package:fineline_coffee/app/core/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

import '../../core/theme/colors.dart';

class TitleComponent extends StatelessWidget {
  const TitleComponent({super.key});

  @override
  Widget build(BuildContext context) {
    const text = AppTextTheme.textTheme;

    return Container(
      padding: const EdgeInsets.all(20),
      color: AppColors.brown20,
      child: SafeArea(
        child: Row(
          children: [
            const Icon(
              TablerIcons.truck_delivery,
              color: AppColors.brown30,
              size: 26,
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Delivery address, tap to change",
                  style: text.bodyMedium?.copyWith(
                    color: AppColors.brown30,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 1),
                Text(
                  "1400 PARK AVE, EMERYVILLE, CA 94608",
                  style: text.bodyMedium?.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
