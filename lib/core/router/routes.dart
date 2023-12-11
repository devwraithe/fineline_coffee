import 'dart:convert';

import 'package:fineline_coffee/app/features/authentication/presentation/register/register_screen.dart';
import 'package:fineline_coffee/app/features/authentication/presentation/reset_password/reset_password_screen.dart';
import 'package:fineline_coffee/core/router/routes_config.dart';
import 'package:fineline_coffee/presentation/pages/customize.dart';
import 'package:go_router/go_router.dart';

import '../../app/features/authentication/presentation/login/login_screen.dart';
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
    name: "register",
    path: "/register",
    parentNavigatorKey: RoutesConfig.navigationKey,
    builder: (context, state) => const RegisterScreen(),
  ),
  GoRoute(
    name: "login",
    path: "/login",
    parentNavigatorKey: RoutesConfig.navigationKey,
    builder: (context, state) => const LoginScreen(),
  ),
  GoRoute(
    name: "reset_password",
    path: "/reset_password",
    parentNavigatorKey: RoutesConfig.navigationKey,
    builder: (context, state) => const ResetPasswordScreen(),
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
