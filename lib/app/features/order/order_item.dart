import 'package:cached_network_image/cached_network_image.dart';
import 'package:fineline_coffee/app/core/theme/colors.dart';
import 'package:fineline_coffee/app/core/theme/text_theme.dart';
import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({
    super.key,
    required this.id,
    required this.image,
    required this.name,
    required this.price,
  });

  final String image, name, price, id;

  @override
  Widget build(BuildContext context) {
    const text = AppTextTheme.textTheme;

    return Container(
      margin: const EdgeInsets.only(bottom: 28),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl: image,
              width: 74,
              height: 74,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: text.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                "\$$price",
                style: AppTextTheme.textTheme.bodyMedium?.copyWith(
                  color: AppColors.brown20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
