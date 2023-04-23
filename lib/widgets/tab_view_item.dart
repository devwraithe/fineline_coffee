import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class TabViewItem extends StatelessWidget {
  final String image, name, description, price;
  const TabViewItem({
    super.key,
    required this.image,
    required this.name,
    required this.description,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: CachedNetworkImage(
            imageUrl: image,
            width: 76,
            height: 76,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 14),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: AppTextTheme.textTheme.bodyLarge,
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: AppTextTheme.textTheme.bodySmall?.copyWith(
                fontSize: 11.0,
                color: AppColors.darkBrown,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "\$$price",
              style: AppTextTheme.textTheme.bodyMedium,
            ),
          ],
        ),
      ],
    );
  }
}
