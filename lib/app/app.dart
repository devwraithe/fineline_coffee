import 'package:flutter/material.dart';

import '../core/router/routes_config.dart';
import '../core/theme/app_theme.dart';

class FinelineCoffee extends StatelessWidget {
  const FinelineCoffee({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Fineline Coffee',
      theme: AppTheme.lightTheme,
      routerConfig: RoutesConfig.routeConfig,
    );
  }
}
