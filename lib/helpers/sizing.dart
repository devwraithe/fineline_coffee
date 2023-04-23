import 'package:flutter/material.dart';

class Sizing {
  static screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
  static screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
}
