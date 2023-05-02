import 'dart:convert';

import 'package:fineline_coffee/presentation/widgets/tab_view_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../domain/drink_entity.dart';

class TabList extends StatelessWidget {
  final List<DrinkEntity> drinks;

  const TabList({
    Key? key,
    required this.drinks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: drinks.length,
        itemBuilder: (context, index) {
          final coffee = drinks[index];

          return GestureDetector(
            onTap: () => context.pushNamed(
              'customize',
              params: {
                'addons': jsonEncode(
                  coffee.addons,
                ),
                'price': coffee.price.toString(),
                'name': coffee.title,
                'image': coffee.image,
                'description': "${coffee.calories}cals, ${coffee.size}oz",
              },
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 30,
              ),
              child: TabViewItem(
                id: coffee.title,
                image: coffee.image,
                name: coffee.title,
                description:
                    "${coffee.calories.toString()}cals, ${coffee.size}oz",
                price: coffee.price.toStringAsFixed(2),
              ),
            ),
          );
        },
      ),
    );
  }
}
