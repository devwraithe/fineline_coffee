import 'package:fineline_coffee/widgets/order_item.dart';
import 'package:fineline_coffee/widgets/payment_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../theme/app_theme.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});
  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBrown,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => context.goNamed('customize'),
                    child: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 20,
                      color: AppColors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      "CHECKOUT",
                      style: AppTextTheme.textTheme.bodyLarge?.copyWith(
                        letterSpacing: 1.8,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Padding(
                      padding: EdgeInsets.only(top: 0, left: 6, right: 0),
                      child: Icon(
                        Icons.remove_shopping_cart_outlined,
                        size: 20,
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 26),
            Expanded(
              child: Container(
                width: double.infinity,
                color: AppColors.white,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 40,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "YOUR ORDER",
                        style: AppTextTheme.textTheme.bodyLarge?.copyWith(
                          letterSpacing: 1,
                          fontWeight: FontWeight.w700,
                          color: AppColors.black,
                        ),
                      ),
                      const SizedBox(height: 25),
                      const OrderItem(
                        image:
                            'https://i.pinimg.com/564x/0a/27/47/0a2747c100a4790920a366a39e242f71.jpg',
                        name: "Frozen Coconut Frappe",
                        description:
                            "Cinnamon Dolce Sprinkles, Vanilla Sweet Cream, Small Cup",
                        price: "3.50",
                        quantity: "3",
                      ),
                      const SizedBox(height: 50),
                      Text(
                        "PICKUP DETAILS",
                        style: AppTextTheme.textTheme.bodyLarge?.copyWith(
                          letterSpacing: 1,
                          fontWeight: FontWeight.w700,
                          color: AppColors.black,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.grey,
                            width: 1.6,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "432nd St, Fremont, California",
                              style:
                                  AppTextTheme.textTheme.bodyMedium?.copyWith(
                                fontSize: 13,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              "Ready in 10 to 12 mins",
                              style:
                                  AppTextTheme.textTheme.bodyMedium?.copyWith(
                                fontSize: 11,
                                color: AppColors.grey,
                              ),
                            ),
                            const SizedBox(height: 25),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Pick in 15 mins.",
                                  style: AppTextTheme.textTheme.bodyMedium
                                      ?.copyWith(
                                    fontSize: 13,
                                  ),
                                ),
                                Text(
                                  "Change",
                                  style: AppTextTheme.textTheme.bodyMedium
                                      ?.copyWith(
                                    fontSize: 13,
                                    color: AppColors.darkBrown,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 50),
                      Text(
                        "PAYMENT METHODS",
                        style: AppTextTheme.textTheme.bodyLarge?.copyWith(
                          letterSpacing: 1,
                          fontWeight: FontWeight.w700,
                          color: AppColors.black,
                        ),
                      ),
                      const SizedBox(height: 24),
                      const PaymentItem(
                        title: "Fineline Coffee Balance",
                        description: "\$136.24",
                      ),
                      const SizedBox(height: 13),
                      const PaymentItem(
                        title: "Mastercard **7890",
                        description: "exp 05/24",
                      ),
                      const SizedBox(height: 13),
                      const PaymentItem(
                        title: "Visa **2345",
                        description: "exp 08/25",
                      ),
                      const SizedBox(height: 50),
                      FilledButton(
                        onPressed: () => context.goNamed("confirmation"),
                        child: const Text(
                          "PAY \$3.50",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
