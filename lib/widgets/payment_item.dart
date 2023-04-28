import 'package:fineline_coffee/theme/app_theme.dart';
import 'package:flutter/material.dart';

class PaymentItem extends StatelessWidget {
  final String title, description;
  final bool isSelected;
  final Function(String) onSelect;

  const PaymentItem({
    super.key,
    required this.title,
    required this.description,
    required this.isSelected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final textColor = isSelected ? AppColors.white : Colors.grey;
    final bgColor = isSelected ? AppColors.black : Colors.transparent;
    final borderColor = isSelected ? AppColors.black : AppColors.grey;

    return GestureDetector(
      onTap: () => onSelect(title),
      child: Container(
        alignment: Alignment.center,
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: bgColor,
          border: Border.all(
            color: borderColor,
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
                color: textColor,
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
      ),
    );
  }
}
