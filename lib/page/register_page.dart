import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_page/component/blob_animation.dart';
import 'package:login_page/component/fade_animation.dart';
import 'package:login_page/component/main_button.dart';
import 'package:login_page/component/main_input.dart';
import 'package:login_page/utils/theme.dart';
import 'package:page_transition/page_transition.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  CustomAnimationControl control = CustomAnimationControl.stop;
  bool nextPage = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        control = CustomAnimationControl.play;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomAnimation<double?>(
              control: control,
              tween: Tween(begin: -400, end: -200), // define tween
              duration: const Duration(seconds: 1), // define duration
              curve: Curves.easeInOutCubic,
              onComplete: () {
                if (nextPage) {}
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
              delay_: const Duration(milliseconds: 2500),
              child_: Align(
                alignment: Alignment.center,
                child: ListView(children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 70, left: 50, right: 50),
                    child: Text(
                      "Yuk Masuk",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 15, left: 50, right: 50),
                    child: MainInput(
                      hintText: "Masukan Username",
                      icon: Icon(
                        Icons.person,
                        color: Colors.black,
                        size: 24,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 34, left: 50, right: 50),
                    child: MainInput(
                      hintText: "Masukan Email",
                      icon: Icon(
                        Icons.mail,
                        color: Colors.black,
                        size: 24,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 34, left: 50, right: 50),
                    child: MainInput(
                      hintText: "Masukan Password",
                      icon: Icon(
                        Icons.lock,
                        color: Colors.black,
                        size: 24,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 34, left: 50, right: 50),
                    child: MainInput(
                      hintText: "Masukan Ulang Password",
                      icon: Icon(
                        Icons.lock,
                        color: Colors.black,
                        size: 24,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 30,
                      left: 50,
                      right: 50,
                    ),
                    child: MainButton(
                        text: "Daftar",
                        onPressed: () {
                          setState(() {});
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 30,
                      left: 50,
                      right: 50,
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Sudah Punya Akun? ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                          Listener(
                            onPointerDown: (e) {
                              Navigator.pop(context);
                            },
                            child: Text("Yuk Login",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: ThemeApp().colors[0])),
                          ),
                        ]),
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
                    child: Container(
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
    );
  }
}
