import 'package:fineline_coffee/pages/customize.dart';
import 'package:go_router/go_router.dart';

import '../pages/checkout.dart';
import '../pages/home.dart';

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
];
