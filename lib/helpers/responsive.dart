import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final dynamic desktop;
  final dynamic smallTab;
  final dynamic mobile;

  const Responsive({
    Key? key,
    this.desktop,
    this.smallTab,
    this.mobile,
  }) : super(key: key);

  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width <= 575.98;
  }

  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.width >= 576 &&
        MediaQuery.of(context).size.width <= 1024.98;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= 1026;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 992) {
          return desktop;
        } else if (constraints.maxWidth >= 576 &&
            constraints.maxWidth <= 991.98) {
          return smallTab ?? desktop;
        } else if (constraints.maxWidth <= 575.98) {
          return mobile ?? desktop;
        } else {
          return desktop;
        }
      },
    );
  }
}
