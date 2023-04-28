import 'package:flutter/material.dart';

import '../../core/theme/app_theme.dart';

class OrderAddons extends StatelessWidget {
  final String addon, price;
  final bool isSelected;
  final VoidCallback onTap;

  const OrderAddons({
    super.key,
    required this.addon,
    required this.price,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.black : Colors.transparent,
                  border: Border.all(
                    color: isSelected ? AppColors.black : AppColors.grey,
                  ),
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
              const SizedBox(width: 14),
              Text(
                addon,
                style: AppTextTheme.textTheme.bodyLarge?.copyWith(
                  color: isSelected ? Colors.black : Colors.grey,
                ),
              ),
            ],
          ),
          Text(
            "\$$price",
            style: AppTextTheme.textTheme.bodyLarge?.copyWith(
              color: isSelected ? Colors.black : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
