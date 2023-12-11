import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../app/core/theme/colors.dart';

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: AppColors.grey40,
            highlightColor: AppColors.grey50,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                      color: AppColors.grey,
                      width: 76,
                      height: 76,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: AppColors.grey,
                        height: 10,
                        width: 180,
                      ),
                      const SizedBox(height: 8),
                      Container(
                        color: Colors.blue,
                        height: 8,
                        width: 90,
                      ),
                      const SizedBox(height: 16),
                      Container(
                        color: Colors.yellow,
                        height: 8,
                        width: 45,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
