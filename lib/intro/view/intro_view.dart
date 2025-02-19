import 'package:flutter/material.dart';
import 'package:weather_app/intro/component/intro.dart';
import 'package:weather_app/intro/controller/intro_controller.dart';

import '../../home/view/premission.dart';

class IntroView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return IntroViewState();
  }
}

class IntroViewState extends State<IntroView> {
  final IntroController introController = IntroController();
  int currentIndex = 0;
  PageController controller = PageController();
  void initState() {
    controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            onPageChanged: (int index) {
              currentIndex = index;
            },
            controller: controller,
            itemCount: introController.listIntro.length,
            itemBuilder: (context, index) {
              return IntroComponent(
                image: introController.listIntro[index].image,
                icon: introController.listIntro[index].icon,
                text1: introController.listIntro[index].text1,
                text2: introController.listIntro[index].text2,
              );
            },
          ),
        ),
        GestureDetector(
          onTap: () {
            if (currentIndex == introController.listIntro.length - 1) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Premission()),
              );
            }
            controller.nextPage(
              duration: Duration(milliseconds: 100),
              curve: Curves.bounceIn,
            );
          },

          child: Container(
            height: 56,
            width: 280,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                colors: [Color(0xff28B2FF), Color(0xff5363F3)],
              ),
            ),
            child: Center(
              child: Text(
                'CONTINUE',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 250),
      ],
    );
  }
}
