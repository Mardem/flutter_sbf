import 'package:flutter/material.dart';

class AppDownAnimation extends StatefulWidget {
  final Widget? child;
  final double? endPosition;
  final int? duration;

  const AppDownAnimation({
    Key? key,
    this.child,
    this.endPosition,
    this.duration,
  }) : super(key: key);

  @override
  _AppDownAnimationState createState() => _AppDownAnimationState();
}

class _AppDownAnimationState extends State<AppDownAnimation>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: Duration(
      seconds: widget.duration ?? 2,
    ),
  )..repeat(reverse: true);

  late final Animation<Offset> _animation = Tween(
    begin: Offset.zero,
    end: Offset(0, widget.endPosition ?? 0.2),
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: widget.child,
    );
  }
}
