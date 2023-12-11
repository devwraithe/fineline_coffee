import 'package:fineline_coffee/presentation/widgets/shimmer_loading.dart';
import 'package:fineline_coffee/presentation/widgets/tab_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/core/theme/colors.dart';
import '../../app/core/theme/text_theme.dart';
import '../providers/providers.dart';
import '../widgets/tab_list.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late TabController _tabController;

  final tabItemStyle = AppTextTheme.textTheme.bodySmall?.copyWith(
    letterSpacing: 1.6,
    color: AppColors.white,
  );

  final List<Widget> _tabs = [
    const Tab(text: "HOT COFFEES"),
    const Tab(text: "COLD COFFEES"),
    const Tab(text: "HOT TEAS"),
    const Tab(text: "COLD TEAS"),
  ];

  final List _hotCoffees = [
    {
      "id": "1",
      "name": "Frozen Coconut Frappe",
      "desc": "20cals, 12oz",
      "price": "3.50",
      "image":
          "https://i.pinimg.com/564x/13/fc/7b/13fc7b57175ac8dd142d75894daa79bf.jpg",
    },
    {
      "id": "2",
      "name": "Chocolate Iced Coffee",
      "desc": "100cals, 12oz",
      "price": "3.50",
      "image":
          "https://i.pinimg.com/564x/0a/27/47/0a2747c100a4790920a366a39e242f71.jpg",
    },
    {
      "id": "3",
      "name": "Frozen Coconut Frappe",
      "desc": "20cals, 12oz",
      "price": "3.50",
      "image":
          "https://i.pinimg.com/564x/13/fc/7b/13fc7b57175ac8dd142d75894daa79bf.jpg",
    },
    {
      "id": "4",
      "name": "Chocolate Iced Coffee",
      "desc": "100cals, 12oz",
      "price": "3.50",
      "image":
          "https://i.pinimg.com/564x/0a/27/47/0a2747c100a4790920a366a39e242f71.jpg",
    },
    {
      "id": "5",
      "name": "Frozen Coconut Frappe",
      "desc": "20cals, 12oz",
      "price": "3.50",
      "image":
          "https://i.pinimg.com/564x/13/fc/7b/13fc7b57175ac8dd142d75894daa79bf.jpg",
    },
    {
      "id": "6",
      "name": "Chocolate Iced Coffee",
      "desc": "100cals, 12oz",
      "price": "3.50",
      "image":
          "https://i.pinimg.com/564x/0a/27/47/0a2747c100a4790920a366a39e242f71.jpg",
    },
    {
      "id": "7",
      "name": "Frozen Coconut Frappe",
      "desc": "20cals, 12oz",
      "price": "3.50",
      "image":
          "https://i.pinimg.com/564x/13/fc/7b/13fc7b57175ac8dd142d75894daa79bf.jpg",
    },
    {
      "id": "8",
      "name": "Chocolate Iced Coffee",
      "desc": "100cals, 12oz",
      "price": "3.50",
      "image":
          "https://i.pinimg.com/564x/0a/27/47/0a2747c100a4790920a366a39e242f71.jpg",
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: _tabs.length,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBrown,
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 26),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Nearest Pickup Point, 5 mins away",
                    style: AppTextTheme.textTheme.bodySmall,
                  ),
                  const SizedBox(height: 7),
                  Text(
                    "432nd St, Fremont, California",
                    style: AppTextTheme.textTheme.bodyMedium?.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 26),
            Container(
              color: AppColors.black,
              height: 50,
              child: TabBar(
                controller: _tabController,
                tabs: _tabs,
                labelStyle: tabItemStyle,
                isScrollable: true,
                unselectedLabelColor: AppColors.white,
                labelColor: AppColors.darkBrown,
                indicator: const BoxDecoration(),
                padding: const EdgeInsets.symmetric(horizontal: 4.6),
                labelPadding: const EdgeInsets.symmetric(horizontal: 18),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                color: AppColors.white,
                child: Consumer(
                  builder: (_, WidgetRef ref, __) {
                    final hotCoffees = ref.watch(hotCoffeesProvider);
                    final coldCoffees = ref.watch(coldCoffeesProvider);
                    final hotTeas = ref.watch(hotTeasProvider);
                    final coldTeas = ref.watch(coldTeasProvider);

                    return TabBarView(
                      controller: _tabController,
                      children: [
                        TabView(
                          title: "HOT COFFEES",
                          items: hotCoffees.isEmpty
                              ? const ShimmerLoading()
                              : TabList(drinks: hotCoffees),
                        ),
                        TabView(
                          title: "COLD COFFEES",
                          items: coldCoffees.isEmpty
                              ? const ShimmerLoading()
                              : TabList(drinks: coldCoffees),
                        ),
                        TabView(
                          title: "HOT TEAS",
                          items: hotTeas.isEmpty
                              ? const ShimmerLoading()
                              : TabList(drinks: hotTeas),
                        ),
                        TabView(
                          title: "COLD TEAS",
                          items: coldTeas.isEmpty
                              ? const ShimmerLoading()
                              : TabList(drinks: coldTeas),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
