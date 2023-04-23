import 'package:fineline_coffee/pages/customize.dart';
import 'package:go_router/go_router.dart';

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
      ),
    ],
  ),
];
