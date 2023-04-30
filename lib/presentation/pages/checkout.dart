import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../core/theme/app_theme.dart';
import '../widgets/order_item.dart';
import '../widgets/payment_item.dart';

class Checkout extends StatefulWidget {
  final String addons, size, name, image;
  final double price;

  const Checkout({
    super.key,
    required this.addons,
    required this.size,
    required this.price,
    required this.name,
    required this.image,
  });
  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  int quantity = 1;

  int increment() {
    setState(() {
      quantity++;
    });
    return quantity;
  }

  int decrement() {
    setState(() {
      quantity--;
    });
    return quantity;
  }

  String? _selectedPayment;
  void _selectPayment(String payment) {
    setState(() {
      _selectedPayment = payment;
    });
  }

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final addons = widget.addons.substring(1, widget.addons.length - 1);
    final selectedSize = widget.size == "SM"
        ? "Small Cup"
        : widget.size == "MD"
            ? "Medium Cup"
            : widget.size == "LG"
                ? "Large Cup"
                : "Extra Large Cup";

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
                    onTap: () => context.pop(),
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
                      OrderItem(
                        image: widget.image,
                        name: widget.name,
                        description:
                            "${addons.isEmpty ? "" : "$addons, "}$selectedSize",
                        price: (widget.price * quantity).toStringAsFixed(2),
                        quantity: quantity.toString(),
                        onIncrease: increment,
                        onDecrease: quantity == 1
                            ? () =>
                                debugPrint("Quantity must not be less than 1")
                            : decrement,
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
                                GestureDetector(
                                  onTap: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: Colors.red,
                                        content: Text(
                                          "Feature is not available in this prototype",
                                          style: AppTextTheme
                                              .textTheme.bodyLarge
                                              ?.copyWith(
                                            color: AppColors.white,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "Change",
                                    style: AppTextTheme.textTheme.bodyMedium
                                        ?.copyWith(
                                      fontSize: 13,
                                      color: AppColors.darkBrown,
                                    ),
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
                      PaymentItem(
                        title: "Fineline Coffee Balance",
                        description: "\$136.24",
                        isSelected:
                            _selectedPayment == "Fineline Coffee Balance",
                        onSelect: _selectPayment,
                      ),
                      const SizedBox(height: 13),
                      PaymentItem(
                        title: "Mastercard **7890",
                        description: "exp 05/24",
                        isSelected: _selectedPayment == "Mastercard **7890",
                        onSelect: _selectPayment,
                      ),
                      const SizedBox(height: 13),
                      PaymentItem(
                        title: "Visa **2345",
                        description: "exp 08/25",
                        isSelected: _selectedPayment == "Visa **2345",
                        onSelect: _selectPayment,
                      ),
                      const SizedBox(height: 50),
                      FilledButton(
                        onPressed: () {
                          if (_selectedPayment != null) {
                            setState(() => _isLoading = true);
                            Future.delayed(const Duration(seconds: 4), () {
                              context.pushReplacementNamed("confirmation");
                              setState(() => _isLoading = false);
                            });
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.red,
                                content: Text(
                                  "Please select a method for payment",
                                  style: AppTextTheme.textTheme.bodyLarge
                                      ?.copyWith(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            );
                          }
                        },
                        child: _isLoading == true
                            ? LoadingAnimationWidget.threeArchedCircle(
                                color: AppColors.white,
                                size: 22,
                              )
                            : Text(
                                "PAY \$${(widget.price * quantity).toStringAsFixed(2)}",
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
