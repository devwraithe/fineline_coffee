import 'package:flutter/cupertino.dart';

import '../theme/app_theme.dart';

class OrderAddons extends StatelessWidget {
  final String addon, price;

  const OrderAddons({
    super.key,
    required this.addon,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.grey,
                ),
                borderRadius: BorderRadius.circular(40),
              ),
            ),
            const SizedBox(width: 14),
            Text(
              addon,
              style: AppTextTheme.textTheme.bodyLarge,
            ),
          ],
        ),
        Text(
          "\$$price",
          style: AppTextTheme.textTheme.bodyLarge,
        ),
      ],
    );
  }
}
