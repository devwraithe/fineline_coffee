import 'package:fineline_coffee/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RoutesConfig {
  static final _navigationKey = GlobalKey<NavigatorState>();
  static final routeConfig = GoRouter(
    initialLocation: '/',
    navigatorKey: _navigationKey,
    routes: routes,
  );
}
