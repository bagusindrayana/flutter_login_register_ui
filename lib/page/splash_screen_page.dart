import 'package:flutter/material.dart';
import 'package:login_page/page/intro_page.dart';
import 'package:page_transition/page_transition.dart';
import 'package:simple_animations/simple_animations.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  CustomAnimationControl control = CustomAnimationControl.mirror;
  bool stop = false;
  bool finish = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        stop = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFFFF6363),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: CustomAnimation<double>(
              control: control,
              tween: Tween(
                  begin: -100.0, end: 100.0), // value for offset x-coordinate
              duration: const Duration(milliseconds: 500),
              animationStatusListener: (status) {
                if (status == AnimationStatus.reverse && stop) {
                  setState(() {
                    control = CustomAnimationControl.stop;
                    finish = true;
                  });
                }
                // print('status updated: $status');
              },
              onComplete: () {
                //print('status complete');
              },
              curve: Curves.easeInQuart, // non-linear animation
              builder: (context, child, value) {
                return Transform.translate(
                  offset:
                      Offset(0, value), // use animated value for x-coordinate
                  child: child,
                );
              },
              child: (!stop || !finish)
                  ? MirrorAnimation<double>(
                      tween: Tween(
                          begin: 200, end: 50), // value for offset x-coordinate
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInQuart, // non-linear animation
                      builder: (context, child, value) {
                        var v = value;
                        if (v > 100) {
                          v = 100;
                        }
                        return Container(
                          width: 100,
                          height: v,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: new BorderRadius.all(
                                  Radius.elliptical(100, v))),
                        );
                      },
                    )
                  : PlayAnimation<double>(
                      tween: Tween(
                          begin: 1,
                          end: (height + 300.0) /
                              100.0), // value for offset x-coordinate
                      duration: const Duration(seconds: 2),
                      curve: Curves.easeOutQuint, // non-linear animation
                      builder: (context, child, value) {
                        return Transform.scale(
                          scale: value,
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                          ),
                        );
                      },
                      onComplete: () {
                        Navigator.pushReplacement(
                            context,
                            PageTransition(
                                type: PageTransitionType.rightToLeft,
                                child: IntroPage()));
                      },
                    ),
            ),
          )
        ],
      ),
    );
  }
}
