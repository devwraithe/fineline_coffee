import 'package:cached_network_image/cached_network_image.dart';
import 'package:fineline_coffee/helpers/sizing.dart';
import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class OrderItem extends StatelessWidget {
  final String image, name, description, price, quantity;
  const OrderItem({
    super.key,
    required this.image,
    required this.name,
    required this.description,
    required this.price,
    required this.quantity,
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
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: AppTextTheme.textTheme.bodyLarge?.copyWith(
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 6),
              SizedBox(
                width: Sizing.screenWidth(context) * 0.5,
                child: Text(
                  description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextTheme.textTheme.bodySmall?.copyWith(
                    fontSize: 11.0,
                    color: AppColors.darkBrown,
                    height: 1.4,
                  ),
                ),
              ),
              const SizedBox(height: 14),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Text(
                      "${quantity}x \$$price",
                      style: AppTextTheme.textTheme.bodyMedium?.copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      qtyIcon("-"),
                      const SizedBox(width: 8),
                      Text(
                        "3",
                        style: AppTextTheme.textTheme.bodyMedium,
                      ),
                      const SizedBox(width: 8),
                      qtyIcon("+"),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget qtyIcon(String icon) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.grey,
        ),
        borderRadius: BorderRadius.circular(40),
      ),
      alignment: Alignment.center,
      child: Text(
        icon,
        style: AppTextTheme.textTheme.bodyMedium?.copyWith(
          color: AppColors.grey,
        ),
      ),
    );
  }
}
