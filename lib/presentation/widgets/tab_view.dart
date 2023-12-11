import 'package:flutter/material.dart';

import '../../app/core/theme/text_theme.dart';

class TabView extends StatefulWidget {
  final String title;
  final Widget items;

  const TabView({
    super.key,
    required this.title,
    required this.items,
  });
  @override
  State<TabView> createState() => _TabViewState();
}

class _TabViewState extends State<TabView> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 33),
          Text(
            widget.title,
            style: AppTextTheme.textTheme.titleMedium,
          ),
          const SizedBox(height: 33),
          widget.items,
          // Column(
          //   children: widget.items,
          // ),
        ],
      ),
    );
  }
}
