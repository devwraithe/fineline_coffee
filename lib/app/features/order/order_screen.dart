import 'package:fineline_coffee/app/core/theme/colors.dart';
import 'package:fineline_coffee/app/features/menu/presentation/menu_item.dart';
import 'package:fineline_coffee/app/features/order/title_component.dart';
import 'package:flutter/material.dart';

import '../../core/theme/text_theme.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    const text = AppTextTheme.textTheme;

    return Scaffold(
      body: Column(
        children: [
          const TitleComponent(),
          Expanded(
            child: Container(
              color: AppColors.grey50,
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 26, 20, 13),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "MENU",
                      style: text.headlineSmall?.copyWith(
                        letterSpacing: 2,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 28),
                    for (int i = 0; i < 10; i++)
                      const MenuItem(
                        id: "0",
                        image:
                            "https://liliebakery.fr/wp-content/uploads/2023/10/Latte-macchiato-Lilie-Bakery.jpg",
                        name: "Hot Coffee",
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
