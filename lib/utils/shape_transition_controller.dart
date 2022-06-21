import 'package:simple_animations/simple_animations.dart';

class ShapeTransitionController {
  CustomAnimationControl _control = CustomAnimationControl.play;
  bool _finish = false;

  bool get finish {
    return _finish;
  }

  set finish(v) {
    _finish = v;
  }

  CustomAnimationControl get control {
    return _control;
  }

  set control(v) {
    _control = v;
  }

  void playAnimation() {
    finish = true;
    control = CustomAnimationControl.play;
  }
}
