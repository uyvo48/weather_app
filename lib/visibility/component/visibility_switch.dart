import 'package:flutter/material.dart';

class Visibility_button extends StatefulWidget {
  @override
  _Visibility_buttonState createState() => _Visibility_buttonState();
}

class _Visibility_buttonState extends State<Visibility_button>
    with SingleTickerProviderStateMixin {
  bool isChecked = false;
  Duration _duration = Duration(milliseconds: 370);
  late Animation<Alignment> _animation;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: _duration,
    );

    _animation = AlignmentTween(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.bounceOut,
        reverseCurve: Curves.bounceIn,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Km'),
        SizedBox(width: 10),
        AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Container(
              width: 110,
              height: 40,
              padding: EdgeInsets.symmetric(horizontal: 4),

              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    spreadRadius: -12.0,
                    blurRadius: 12.0,
                  ),
                ],
                color: Color(0xff4DBFF9),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: _animation.value,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (_animationController.isCompleted) {
                            _animationController.reverse();
                          } else {
                            _animationController.forward();
                          }

                          isChecked = !isChecked;
                        });
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 34,
                            height: 34,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              shape: BoxShape.rectangle,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            width: 22,
                            height: 22,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xffEBEBEB),
                                  blurRadius: 4,
                                  offset: Offset(1, 1),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        SizedBox(width: 10),
        Text('Mi'),
      ],
    );
  }
}
