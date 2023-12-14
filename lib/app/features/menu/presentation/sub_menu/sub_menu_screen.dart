import 'package:fineline_coffee/app/core/theme/colors.dart';
import 'package:fineline_coffee/app/core/utilities/helpers/ui_helpers.dart';
import 'package:fineline_coffee/app/features/menu/presentation/sub_menu/cubit/sub_menu_cubit.dart';
import 'package:fineline_coffee/app/features/order/order_item.dart';
import 'package:fineline_coffee/app/features/order/title_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/text_theme.dart';
import 'cubit/sub_menu_state.dart';

class SubMenuScreen extends StatefulWidget {
  const SubMenuScreen({
    super.key,
    required this.id,
    required this.menuType,
  });

  final String id, menuType;

  @override
  State<SubMenuScreen> createState() => _SubMenuScreenState();
}

class _SubMenuScreenState extends State<SubMenuScreen> {
  String? id;

  @override
  void initState() {
    super.initState();
    debugPrint(widget.id);
    BlocProvider.of<SubMenuCubit>(context).getSubMenu(
      widget.id,
    );
  }

  @override
  Widget build(BuildContext context) {
    const text = AppTextTheme.textTheme;

    return Scaffold(
      body: Column(
        children: [
          const TitleComponent(),
          Expanded(
            child: Container(
              color: AppColors.grey50,
              width: double.infinity,
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 26, 20, 13),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.menuType.toUpperCase(),
                      style: text.headlineSmall?.copyWith(
                        letterSpacing: 2,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 28),
                    BlocBuilder<SubMenuCubit, SubMenuState>(
                      builder: (context, state) {
                        if (state is SubMenuLoading) {
                          return UiHelpers.loader();
                        }
                        if (state is SubMenuLoaded) {
                          final menu = state.result;

                          if (menu.isNotEmpty) {
                            return Column(
                              children: [
                                for (final item in menu)
                                  OrderItem(
                                    id: item.id,
                                    image: item.image,
                                    name: item.name,
                                    price: item.price.toString(),
                                  ),
                              ],
                            );
                          } else {
                            return const Text("Nothing available");
                          }
                        } else if (state is SubMenuError) {
                          return Text(state.message);
                        } else {
                          return const SizedBox();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
