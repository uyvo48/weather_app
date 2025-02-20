import 'package:flutter/material.dart';
import 'package:weather_app/themes/controller/theme_controller.dart';

import '../component/theme.dart';

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
      appBar: AppBar(
        titleSpacing: 0,
        centerTitle: true,
        leading: Container(
          padding: EdgeInsets.all(10),
          child: IconButton(
            onPressed: null,
            color: Colors.white,
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(Colors.white),
            ),
            icon: Icon(Icons.arrow_back_ios_rounded, size: 18),
          ),
        ),
        title: Text(
          "Theme",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        actions: [],
      ),
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
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ThemePage(
                  image: themeController.listImageTheme[index],
                  choose: selectedIndex == index,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
