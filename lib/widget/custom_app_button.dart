import 'package:flutter/material.dart';

class CustomAppButton extends StatefulWidget {
  final Function? onPressed;
  final String? text;
  final double? width;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? splashColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final TextStyle? textStyle;
  final ShapeBorder? shapeBorder;
  final Widget? child;
  final double? elevation;
  final double? height;
  final double radius;
  final BoxDecoration? decoration;
  final bool enabled;
  final bool enableScaleAnimation;
  final Color? disabledTextColor;
  final double? hoverElevation;
  final double? focusElevation;
  final double? highlightElevation;

  const CustomAppButton({
    this.onPressed,
    this.text,
    this.width,
    this.backgroundColor,
    this.textColor,
    this.padding,
    this.margin,
    this.textStyle,
    this.shapeBorder,
    this.child,
    this.elevation,
    this.enabled = true,
    this.radius = 8,
    this.decoration,
    this.height,
    this.splashColor,
    this.enableScaleAnimation = true,
    this.disabledTextColor,
    this.hoverElevation,
    this.focusElevation,
    this.highlightElevation,
    super.key,
  });

  @override
  State<CustomAppButton> createState() => _CustomAppButtonState();
}

class _CustomAppButtonState extends State<CustomAppButton>
    with SingleTickerProviderStateMixin {
  double _scale = 1.0;
  AnimationController? _controller;

  @override
  void initState() {
    if (widget.enableScaleAnimation) {
      _controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 50),
        lowerBound: 0.0,
        upperBound: 0.1,
      )..addListener(() {
        setState(() {});
      });
    }
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Widget _buildButton() {
    return Container(
      margin: widget.margin ?? EdgeInsets.zero,
      decoration: widget.decoration,
      child: Material(
        color: widget.backgroundColor ?? Colors.transparent,
        shape:
            widget.shapeBorder ??
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(widget.radius),
            ),
        elevation: widget.elevation ?? 0,
        child: InkWell(
          onTap: widget.enabled ? widget.onPressed as void Function()? : null,
          splashColor: widget.splashColor,
          borderRadius: BorderRadius.circular(widget.radius),
          child: Container(
            width: widget.width,
            height: widget.height,
            alignment: Alignment.center,
            child: Padding(
              padding: widget.padding ?? EdgeInsets.zero,
              child:
                  widget.child ??
                  Text(
                    widget.text ?? '',
                    style: Theme.of(
                      context,
                    ).textTheme.displayMedium?.merge(widget.textStyle),
                  ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_controller != null && widget.enabled) {
      _scale = 1 - _controller!.value * 0.35;
    }

    if (widget.enableScaleAnimation) {
      return Listener(
        onPointerDown: (details) {
          _controller?.forward();
        },
        onPointerUp: (details) {
          _controller?.reverse();
        },
        child: Transform.scale(scale: _scale, child: _buildButton()),
      );
    } else {
      return _buildButton();
    }
  }
}
