import 'package:fineline_coffee/app/core/theme/colors.dart';
import 'package:fineline_coffee/app/core/utilities/helpers/ui_helpers.dart';
import 'package:fineline_coffee/app/features/menu/presentation/cubits/menus_cubit.dart';
import 'package:fineline_coffee/app/features/menu/presentation/cubits/menus_state.dart';
import 'package:fineline_coffee/app/features/menu/presentation/menu_item.dart';
import 'package:fineline_coffee/app/features/order/title_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/text_theme.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<MenusCubit>(context).getMenu();
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
                      "MENU",
                      style: text.headlineSmall?.copyWith(
                        letterSpacing: 2,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 28),
                    BlocBuilder<MenusCubit, MenusState>(
                      builder: (context, state) {
                        if (state is MenusLoading) {
                          return UiHelpers.loader();
                        }
                        if (state is MenusLoaded) {
                          final menu = state.result;

                          if (menu.isNotEmpty) {
                            return Column(
                              children: [
                                for (final item in menu)
                                  MenuItem(
                                    id: item.id,
                                    image: item.image,
                                    name: item.name,
                                  ),
                              ],
                            );
                          } else {
                            return const Text("Nothing available");
                          }
                        } else if (state is MenusError) {
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
