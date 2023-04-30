import 'dart:convert';

import 'package:fineline_coffee/core/router/routes_config.dart';
import 'package:fineline_coffee/presentation/pages/customize.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/pages/checkout.dart';
import '../../presentation/pages/confirmation.dart';
import '../../presentation/pages/home.dart';

final routes = [
  GoRoute(
    name: "home",
    path: "/home",
    parentNavigatorKey: RoutesConfig.navigationKey,
    builder: (context, state) => const Home(),
  ),
  GoRoute(
    name: "customize",
    path: "/customize/:addons/:price/:name/:image/:description",
    parentNavigatorKey: RoutesConfig.navigationKey,
    builder: (context, state) => Customize(
      addons: jsonDecode(state.params['addons']!).cast<Map<String, dynamic>>(),
      price: double.parse(state.params['price']!),
      name: state.params['name']!,
      image: state.params['image']!,
      description: state.params['description']!,
    ),
  ),
  GoRoute(
    name: "checkout",
    path: "/checkout/:selected_addons/:size/:total_price/:name/:image",
    parentNavigatorKey: RoutesConfig.navigationKey,
    builder: (context, state) => Checkout(
      addons: state.params['selected_addons']!,
      size: state.params['size']!,
      price: double.parse(state.params['total_price']!),
      name: state.params['name']!,
      image: state.params['image']!,
    ),
  ),
  GoRoute(
    name: "confirmation",
    path: "/confirmation",
    parentNavigatorKey: RoutesConfig.navigationKey,
    builder: (context, state) => const Confirmation(),
  ),
];
