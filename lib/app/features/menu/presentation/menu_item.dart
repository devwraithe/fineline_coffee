import 'package:cached_network_image/cached_network_image.dart';
import 'package:fineline_coffee/app/core/theme/colors.dart';
import 'package:fineline_coffee/app/core/theme/text_theme.dart';
import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key,
    required this.id,
    required this.image,
    required this.name,
  });

  final String image, name, id;

  @override
  Widget build(BuildContext context) {
    const text = AppTextTheme.textTheme;

    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      decoration: const BoxDecoration(
        color: AppColors.white10,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(6),
              bottomLeft: Radius.circular(6),
            ),
            child: CachedNetworkImage(
              imageUrl: image,
              width: 74,
              height: 74,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 20),
          Text(
            name,
            style: text.headlineSmall?.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
