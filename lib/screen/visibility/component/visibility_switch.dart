import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/app_bloc/app_bloc.dart';
import 'package:weather_app/app_bloc/app_state.dart';

class VisibilityButton extends StatefulWidget {
  final bool isMiles;
  final Function(bool) onUnitChanged;
  final Color buttonColor; // Thêm thuộc tính để nhận màu từ state

  const VisibilityButton({
    super.key,
    required this.isMiles,
    required this.onUnitChanged,
    required this.buttonColor,
  });

  @override
  _VisibilityButtonState createState() {
    return _VisibilityButtonState();
  }
}

class _VisibilityButtonState extends State<VisibilityButton>
    with SingleTickerProviderStateMixin {
  late Animation<Alignment> _animation;
  late AnimationController _animationController;
  final Duration _duration = const Duration(milliseconds: 100);

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

    if (widget.isMiles) {
      _animationController.value = 1.0;
    }
  }

  @override
  void didUpdateWidget(VisibilityButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isMiles != oldWidget.isMiles) {
      if (widget.isMiles) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    }
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
        const Text(
          'Km',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(width: 10),
        BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            return AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Container(
                  width: 110,
                  height: 40,
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        spreadRadius: -12.0,
                        blurRadius: 12.0,
                      ),
                    ],
                    color: widget.buttonColor, // Sử dụng màu từ state
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: _animation.value,
                        child: GestureDetector(
                          onTap: () {
                            if (_animationController.isCompleted) {
                              _animationController.reverse();
                            } else {
                              _animationController.forward();
                            }
                            widget.onUnitChanged(!widget.isMiles);
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
                                decoration: const BoxDecoration(
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
            );
          },
        ),
        const SizedBox(width: 10),
        const Text(
          'Mi',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
