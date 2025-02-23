import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/home/home_controller/home_controller.dart';

import '../component/setting.dart';

class SettingView extends StatefulWidget {
  const SettingView({super.key});

  @override
  State<StatefulWidget> createState() {
    return SettingViewState();
  }
}

class SettingViewState extends State<SettingView> {
  final HomeController homeController = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
        titleSpacing: 0,
        centerTitle: true,
        leading: Container(
          padding: EdgeInsets.all(10),
          child: IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            color: Colors.white,
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(Colors.white),
            ),
            icon: Icon(Icons.arrow_back_ios_rounded, size: 18),
          ),
        ),
        title: Text(
          "Setting",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),

      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: homeController.listSetting.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  child: Setting(
                    icon: homeController.listSetting[index].icon,
                    text: homeController.listSetting[index].text,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
