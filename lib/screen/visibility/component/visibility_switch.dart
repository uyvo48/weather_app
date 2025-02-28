import 'package:flutter/material.dart';

class VisibilityButton extends StatefulWidget {
  final Function(bool) onUnitChanged; // Callback để thông báo thay đổi

  const VisibilityButton({super.key, required this.onUnitChanged});

  @override
  _VisibilityButtonState createState() => _VisibilityButtonState();
}

class _VisibilityButtonState extends State<VisibilityButton>
    with SingleTickerProviderStateMixin {
  bool isChecked = false;
  final Duration _duration = Duration(milliseconds: 370);
  late Animation<Alignment> _animation;
  late AnimationController _animationController;
  final Color _kmColor = Color(0xff4DBFF9);
  final Color _miColor = Color(0xffFF6F61);

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
        Text('Km', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
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
                color: isChecked ? _miColor : _kmColor,
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
                          widget.onUnitChanged(isChecked); // Gọi callback
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
        Text('Mi', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
      ],
    );
  }
}
