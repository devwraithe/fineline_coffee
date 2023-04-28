import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/helpers/sizing.dart';
import '../../core/theme/theme.dart';
import '../widgets/order_addons.dart';
import '../widgets/order_size.dart';

class Customize extends StatefulWidget {
  const Customize({super.key});
  @override
  State<Customize> createState() => _CustomizeState();
}

class _CustomizeState extends State<Customize> with TickerProviderStateMixin {
  // handle the sizing selection
  String? _selectedSize;
  void _selectSize(String size) {
    setState(() {
      _selectedSize = size;
    });
  }

  // handle the addons selection
  final List<String> _selectedAddOns = [];
  final List<double> _selectedAddonPrice = [];
  void _toggleAddOn(String addOn, double addOnPrice) {
    setState(() {
      if (_selectedAddOns.contains(addOn)) {
        _selectedAddOns.remove(addOn);
        _selectedAddonPrice.remove(addOnPrice);
      } else {
        _selectedAddOns.add(addOn);
        _selectedAddonPrice.add(addOnPrice);
      }
    });
  }

  // list of addons
  final List addons = [
    {
      "name": "Extra Milk",
      "price": 1.50,
    },
    {
      "name": "Whipped Cream",
      "price": 2.50,
    },
    {
      "name": "Extra Sugar",
      "price": 0.80,
    },
    {
      "name": "Malt Powder",
      "price": 4.20,
    },
    {
      "name": "Honey Syrup",
      "price": 6.05,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenHeight = Sizing.screenHeight(context);

    // addition of the base price and the addons
    double total = _selectedAddonPrice.fold(0, (previousValue, element) {
      return previousValue + element;
    });

    return Scaffold(
      backgroundColor: AppColors.white,
      body: CustomScrollView(
        slivers: [
          SliverLayoutBuilder(
            builder: (BuildContext context, constraints) {
              return SliverAppBar(
                centerTitle: true,
                expandedHeight: screenHeight * 0.42,
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
                  background: Stack(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: CachedNetworkImage(
                          imageUrl:
                              'https://i.pinimg.com/564x/13/fc/7b/13fc7b57175ac8dd142d75894daa79bf.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
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
                    ],
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
                        children: [
                          OrderSize(
                            size: "SM",
                            isSelected: _selectedSize == "SM",
                            onSelect: _selectSize,
                          ),
                          const SizedBox(width: 19),
                          OrderSize(
                            size: "MD",
                            isSelected: _selectedSize == "MD",
                            onSelect: _selectSize,
                          ),
                          const SizedBox(width: 19),
                          OrderSize(
                            size: "LG",
                            isSelected: _selectedSize == "LG",
                            onSelect: _selectSize,
                          ),
                          const SizedBox(width: 19),
                          OrderSize(
                            size: "XL",
                            isSelected: _selectedSize == "XL",
                            onSelect: _selectSize,
                          ),
                        ],
                      ),
                      const SizedBox(height: 51),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "ORDER ADD ONS",
                            style: AppTextTheme.textTheme.bodyMedium?.copyWith(
                              letterSpacing: 1,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "${_selectedAddOns.length.toString()} Selected",
                            style: AppTextTheme.textTheme.bodyLarge?.copyWith(
                              // letterSpacing: 1,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 23),
                      for (final addon in addons)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: OrderAddons(
                            addon: addon['name'],
                            price: addon['price'].toString(),
                            isSelected: _selectedAddOns.contains(addon['name']),
                            onTap: () => _toggleAddOn(
                              addon['name'],
                              addon['price'],
                            ),
                          ),
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
                            "\$${(total + 30.0).toString()}",
                            style: AppTextTheme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 21),
                      FilledButton(
                        onPressed: () => context.goNamed("checkout"),
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
