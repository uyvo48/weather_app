import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/component/app_bar_setting_item.dart';
import 'package:weather_app/router/app_router.dart';

import '../../../app_bloc/app_bloc.dart';
import '../../../app_bloc/app_event.dart';
import '../component/theme_page.dart';
import '../controller/theme_controller.dart';

class ThemeView extends StatefulWidget {
  const ThemeView({super.key});

  @override
  State<ThemeView> createState() => _ThemeViewState();
}

class _ThemeViewState extends State<ThemeView> {
  final ThemeController themeController = ThemeController();
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSettingItem(textSettingItem: 'Theme'),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: GridView.builder(
          itemCount: themeController.listImageTheme.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 2,
            mainAxisSpacing: 4,
          ),
          itemBuilder: (BuildContext context, int index) {
            final theme = themeController.listImageTheme[index];
            return GestureDetector(
              onTapDown: (_) {
                setState(() {
                  selectedIndex = index;
                });
              },
              onTapUp: (_) {
                setState(() {
                  selectedIndex = -1;
                });
              },
              onTap: () {
                context.read<AppBloc>().add(SetThemeEvent(imageTheme: theme));
                GoRouter.of(context).go(AppRouter.homeScreen);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ThemePage(choose: selectedIndex == index, image: theme),
              ),
            );
          },
        ),
      ),
    );
  }
}
