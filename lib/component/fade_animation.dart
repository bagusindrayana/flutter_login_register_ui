import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class FadeAnimation extends StatelessWidget {
  final Widget child_;
  final Duration delay_;
  const FadeAnimation({Key? key, required this.child_, required this.delay_})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlayAnimation<double?>(
        tween: Tween(begin: 0, end: 1), // define tween
        duration: const Duration(seconds: 1),
        delay: delay_, // define duration
        curve: Curves.easeInOutCubic,
        builder: (context, child, value) {
          return Opacity(opacity: value!, child: child_);
        });
  }
}
