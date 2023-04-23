import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class OrderSize extends StatelessWidget {
  final String size;

  const OrderSize({
    super.key,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.grey,
            width: 1.4,
          ),
        ),
        alignment: Alignment.center,
        height: 48,
        child: Text(
          size,
          style: AppTextTheme.textTheme.bodyMedium?.copyWith(
            color: AppColors.grey,
          ),
        ),
      ),
    );
  }
}
