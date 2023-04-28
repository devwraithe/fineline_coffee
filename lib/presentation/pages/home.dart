import 'package:fineline_coffee/presentation/widgets/shimmer_loading.dart';
import 'package:fineline_coffee/presentation/widgets/tab_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/app_theme.dart';
import '../providers/providers.dart';
import '../widgets/tab_view_item.dart';

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

  final List _coldCoffees = [
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
  ];

  late List<AnimationController> _controllerList;
  late List<Animation<double>> _animationList;

  void hotCoffeeAnimation() {
    _controllerList = List.generate(
      _hotCoffees.length,
      (int index) => AnimationController(
        duration: const Duration(milliseconds: 400),
        vsync: this,
      ),
    );
    _animationList = List.generate(
      _hotCoffees.length,
      (int index) => Tween<double>(
        begin: 0.0,
        end: 1.0,
      ).animate(
        CurvedAnimation(
          parent: _controllerList[index],
          curve: Curves.easeOut,
        ),
      ),
    );

    // Start the animations with a delay for each item
    for (int i = 0; i < _hotCoffees.length; i++) {
      Future.delayed(Duration(milliseconds: 200 * i), () {
        _controllerList[i].forward();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: _tabs.length,
      vsync: this,
    );
    hotCoffeeAnimation();
  }

  @override
  void dispose() {
    for (int i = 0; i < _hotCoffees.length; i++) {
      _controllerList[i].dispose();
    }
    super.dispose();
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
                    final drinksProvider = ref.watch(fetchDrinksProvider);
                    return TabBarView(
                      controller: _tabController,
                      children: [
                        TabView(
                          title: "HOT COFFEES",
                          items: drinksProvider.isEmpty
                              ? const ShimmerLoading()
                              : Expanded(
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: drinksProvider.length,
                                    itemBuilder: (context, index) {
                                      final coffee = drinksProvider[index];

                                      return FadeTransition(
                                        opacity: _animationList[index],
                                        child: GestureDetector(
                                          onTap: () =>
                                              context.goNamed('customize'),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 30),
                                            child: TabViewItem(
                                              id: coffee.title,
                                              image: coffee.image,
                                              name: coffee.title,
                                              description:
                                                  "${coffee.calories.toString()}cals, ${coffee.size}oz",
                                              price: coffee.price.toString(),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                        ),
                        const Text(""),
                        const Text(""),
                        const Text(""),
                      ],
                    );
                  },
                ),
                // child: TabBarView(
                //   controller: _tabController,
                //   children: [
                //     TabView(
                //       title: "HOT COFFEES",
                //       items: Expanded(
                //         child: ListView.builder(
                //           shrinkWrap: true,
                //           itemCount: _hotCoffees.length,
                //           itemBuilder: (context, index) {
                //             final coffee = _hotCoffees[index];
                //             return FadeTransition(
                //               opacity: _animationList[index],
                //               child: GestureDetector(
                //                 onTap: () => context.goNamed('customize'),
                //                 child: Padding(
                //                   padding: const EdgeInsets.only(bottom: 30),
                //                   child: TabViewItem(
                //                     id: coffee['id'],
                //                     image: coffee['image'],
                //                     name: coffee['name'],
                //                     description: coffee['desc'],
                //                     price: coffee['price'],
                //                   ),
                //                 ),
                //               ),
                //             );
                //           },
                //         ),
                //       ),
                //     ),
                //     TabView(
                //       title: "COLD COFFEES",
                //       items: Expanded(
                //         child: ListView.builder(
                //           shrinkWrap: true,
                //           itemCount: _coldCoffees.length,
                //           itemBuilder: (context, index) {
                //             final coffee = _coldCoffees[index];
                //
                //             return FadeTransition(
                //               opacity: _animationList[index],
                //               child: Padding(
                //                 padding: const EdgeInsets.only(bottom: 30),
                //                 child: TabViewItem(
                //                   id: coffee['id'],
                //                   image: coffee['image'],
                //                   name: coffee['name'],
                //                   description: coffee['desc'],
                //                   price: coffee['price'],
                //                 ),
                //               ),
                //             );
                //           },
                //         ),
                //       ),
                //     ),
                //     const Text(""),
                //     const Text(""),
                //   ],
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
