import 'package:fineline_coffee/theme/app_theme.dart';
import 'package:flutter/material.dart';

class PaymentItem extends StatelessWidget {
  final String title, description;
  const PaymentItem({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.grey,
          width: 1.6,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextTheme.textTheme.bodyMedium?.copyWith(
              fontSize: 13,
            ),
          ),
          Text(
            description,
            style: AppTextTheme.textTheme.bodyMedium?.copyWith(
              fontSize: 13,
              color: AppColors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
