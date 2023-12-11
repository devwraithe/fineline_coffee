import 'package:flutter/material.dart';

import '../../app/core/theme/colors.dart';
import '../../app/core/theme/text_theme.dart';

class OrderSize extends StatelessWidget {
  final String size;
  final bool isSelected;
  final Function(String) onSelect;

  const OrderSize({
    super.key,
    required this.size,
    required this.isSelected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final textColor = isSelected ? AppColors.white : Colors.grey;
    final bgColor = isSelected ? AppColors.black : Colors.transparent;
    final borderColor = isSelected ? AppColors.black : AppColors.grey;

    return Expanded(
      child: GestureDetector(
        onTap: () => onSelect(size),
        child: Container(
          decoration: BoxDecoration(
            color: bgColor,
            border: Border.all(
              color: borderColor,
              width: 1.4,
            ),
          ),
          alignment: Alignment.center,
          height: 48,
          child: Text(
            size,
            style: AppTextTheme.textTheme.bodyMedium?.copyWith(
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
