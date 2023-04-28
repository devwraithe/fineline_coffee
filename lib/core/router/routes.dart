import 'package:fineline_coffee/presentation/pages/customize.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/pages/checkout.dart';
import '../../presentation/pages/confirmation.dart';
import '../../presentation/pages/home.dart';

final routes = [
  GoRoute(
    name: "home",
    path: "/",
    builder: (context, state) => const Home(),
    routes: [
      GoRoute(
        name: "customize",
        path: "customize",
        builder: (context, state) => const Customize(),
        routes: [
          GoRoute(
            name: "checkout",
            path: "checkout",
            builder: (context, state) => const Checkout(),
          ),
        ],
      ),
    ],
  ),
  GoRoute(
    name: "confirmation",
    path: "/confirmation",
    builder: (context, state) => const Confirmation(),
  ),
];
