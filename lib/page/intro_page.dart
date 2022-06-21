import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_page/component/blob_animation.dart';
import 'package:login_page/component/fade_animation.dart';
import 'package:login_page/component/main_button.dart';
import 'package:login_page/component/shape_transition.dart';
import 'package:login_page/page/login_page.dart';
import 'package:login_page/utils/shape_transition_controller.dart';
import 'package:login_page/utils/theme.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import 'package:simple_animations/simple_animations.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  CustomAnimationControl control = CustomAnimationControl.play;
  bool nextPage = false;
  ShapeTransitionController controller = new ShapeTransitionController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ShapeTransition(
        color: ThemeApp().colors[0],
        controller: controller,
        onFinish: () {
          setState(() {
            nextPage = true;
            control = CustomAnimationControl.playReverse;
          });
        },
        child: Stack(
          children: [
            CustomAnimation<double?>(
                control: control,
                tween: Tween(begin: -400, end: -200), // define tween
                duration: const Duration(seconds: 1), // define duration
                curve: Curves.easeInOutCubic,
                onComplete: () {
                  if (nextPage) {
                    Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.fade,
                                duration: Duration(seconds: 1),
                                child: LoginPage()))
                        .then((value) {
                      setState(() {
                        nextPage = false;
                        controller.control = CustomAnimationControl.playReverse;
                        control = CustomAnimationControl.play;
                      });
                    });
                  }
                },
                builder: (context, child, value) {
                  return Positioned(
                      top: value,
                      right: -200,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          BlobAnimation(
                              blobSize: 400,
                              blobColor: ThemeApp().colors[0],
                              animDuration: const Duration(seconds: 10)),
                          BlobAnimation(
                              blobSize: 350,
                              blobColor: ThemeApp().colors[1],
                              animDuration: const Duration(seconds: 9))
                        ],
                      ));
                }),
            FadeAnimation(
                delay_: const Duration(milliseconds: 1500),
                child_: Align(
                  alignment: Alignment.center,
                  child: ListView(children: [
                    Padding(
                      padding: EdgeInsets.only(top: 150),
                      child: SvgPicture.asset("assets/svg/undraw_education.svg",
                          semanticsLabel: 'Blob 2'),
                    ),
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 70, left: 50, right: 50),
                        child: Text(
                          "Ruang Belajar",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 15, left: 50, right: 50),
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nascetur tincidunt egestas mi suscipit et.",
                        style: TextStyle(fontFamily: 'Poppins', fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 30,
                        left: 50,
                        right: 50,
                      ),
                      child: MainButton(
                          text: "Selanjutnya",
                          onPressed: () {
                            setState(() {
                              controller.playAnimation();
                              // control = CustomAnimationControl.playReverse;
                            });
                          }),
                    )
                  ]),
                )),
            CustomAnimation<double?>(
                control: control,
                tween: Tween(begin: -200, end: 0), // define tween
                duration: const Duration(seconds: 1), // define duration
                curve: Curves.easeInOutCubic,
                builder: (context, child, value) {
                  return Positioned(
                      bottom: value,
                      left: 0,
                      right: 0,
                      child: SizedBox(
                        height: 100,
                        child: WaveWidget(
                          config: CustomConfig(
                            colors: ThemeApp().colors,
                            durations: ThemeApp().durations,
                            heightPercentages: ThemeApp().heightPercentages,
                          ),
                          size: Size(double.infinity, double.infinity),
                          waveAmplitude: 0,
                        ),
                      ));
                })
          ],
        ),
      ),
    );
  }
}
