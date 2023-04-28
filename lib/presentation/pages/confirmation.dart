import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/app_theme.dart';

class Confirmation extends StatelessWidget {
  const Confirmation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 26,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => context.goNamed('home'),
                child: const Icon(
                  Icons.close,
                  size: 26,
                  color: AppColors.grey,
                ),
              ),
              const SizedBox(height: 100),
              content(
                "THANK YOU FOR USING FINELINE",
                "Order Successful",
                Colors.green,
              ),
              const SizedBox(height: 44),
              content(
                "YOUR ORDER WILL BE READY IN",
                "10 to 12 minutes",
              ),
              const SizedBox(height: 44),
              content(
                "YOU CAN PICKUP THE ORDER AT",
                "432nd St, Fremont, California",
              ),
              const SizedBox(height: 44),
              content(
                "YOUR ORDER CODE IS",
                "9Z8Y7X6W",
              ),
              const Spacer(),
              Text(
                "You have to present your confirmation code to the barista before you can pickup your order, this helps us avoid order mix ups.",
                textAlign: TextAlign.center,
                style: AppTextTheme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column content(String title, String info, [Color? color]) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextTheme.textTheme.bodyMedium?.copyWith(
            letterSpacing: 1.4,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          info,
          style: AppTextTheme.textTheme.headlineSmall?.copyWith(
            color: color,
          ),
        ),
      ],
    );
  }
}
