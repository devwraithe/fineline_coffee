import 'package:fineline_coffee/widgets/order_addons.dart';
import 'package:fineline_coffee/widgets/order_size.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../helpers/sizing.dart';
import '../theme/theme.dart';

class Customize extends StatefulWidget {
  const Customize({super.key});
  @override
  State<Customize> createState() => _CustomizeState();
}

class _CustomizeState extends State<Customize> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final screenHeight = Sizing.screenHeight(context);

    return Scaffold(
      backgroundColor: AppColors.white,
      body: CustomScrollView(
        slivers: [
          SliverLayoutBuilder(
            builder: (BuildContext context, constraints) {
              final scrolled = constraints.scrollOffset > screenHeight * 0.26;
              return SliverAppBar(
                centerTitle: true,
                expandedHeight: screenHeight * 0.40,
                collapsedHeight: 66,
                backgroundColor: AppColors.darkBrown,
                leading: GestureDetector(
                  onTap: () => context.goNamed('home'),
                  child: const Padding(
                    padding: EdgeInsets.only(top: 0, left: 6, right: 0),
                    child: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 20,
                      color: AppColors.white,
                    ),
                  ),
                ),
                title: Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    "CUSTOMIZE",
                    style: AppTextTheme.textTheme.bodyLarge?.copyWith(
                      letterSpacing: 1.8,
                      fontWeight: FontWeight.w700,
                      color: AppColors.white,
                    ),
                  ),
                ),
                pinned: true,
                snap: false,
                floating: true,
                shadowColor: Colors.grey.withOpacity(0.4),
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://i.pinimg.com/564x/0a/27/47/0a2747c100a4790920a366a39e242f71.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppColors.black.withOpacity(0.5),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "FROZEN COCONUT FRAPPE",
                        style: AppTextTheme.textTheme.titleSmall?.copyWith(
                          letterSpacing: 1.2,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 13),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "20cals, 12oz",
                            style: AppTextTheme.textTheme.bodyLarge?.copyWith(
                              color: AppColors.darkBrown,
                            ),
                          ),
                          Text(
                            "\$3.50",
                            style: AppTextTheme.textTheme.bodyLarge,
                          ),
                        ],
                      ),
                      const SizedBox(height: 51),
                      Text(
                        "PICK ORDER SIZE",
                        style: AppTextTheme.textTheme.bodyMedium?.copyWith(
                          letterSpacing: 1,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 18),
                      Row(
                        children: const [
                          OrderSize(size: "SM"),
                          SizedBox(width: 19),
                          OrderSize(size: "MD"),
                          SizedBox(width: 19),
                          OrderSize(size: "LG"),
                          SizedBox(width: 19),
                          OrderSize(size: "XL"),
                        ],
                      ),
                      const SizedBox(height: 51),
                      Text(
                        "ORDER ADD ONS",
                        style: AppTextTheme.textTheme.bodyMedium?.copyWith(
                          letterSpacing: 1,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 23),
                      const OrderAddons(
                        addon: "Steamed Hot Milk",
                        price: "0.32",
                      ),
                      const SizedBox(height: 20),
                      const OrderAddons(
                        addon: "Chocolate Malt Powder",
                        price: "0.32",
                      ),
                      const SizedBox(height: 20),
                      const OrderAddons(
                        addon: "Cinnamon Dolce Sprinkles",
                        price: "0.32",
                      ),
                      const SizedBox(height: 20),
                      const OrderAddons(
                        addon: "Whipped Cream",
                        price: "0.32",
                      ),
                      const SizedBox(height: 20),
                      const OrderAddons(
                        addon: "Vanilla Sweet Cream",
                        price: "0.32",
                      ),
                      const SizedBox(height: 51),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "TOTAL",
                            style: AppTextTheme.textTheme.bodyMedium?.copyWith(
                              letterSpacing: 1,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "\$30.0",
                            style: AppTextTheme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 21),
                      FilledButton(
                        onPressed: () {},
                        child: const Text(
                          "CHECKOUT",
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 42),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
