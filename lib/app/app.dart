import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/router/routes_config.dart';
import 'core/theme/theme.dart';
import 'core/utilities/services/bloc_providers.dart';

class FinelineCoffee extends StatelessWidget {
  const FinelineCoffee({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: blocProviders(),
      child: MaterialApp.router(
        title: 'Fineline Coffee',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        themeMode: ThemeMode.light,
        routerConfig: RoutesConfig.routeConfig,
      ),
    );
  }
}
