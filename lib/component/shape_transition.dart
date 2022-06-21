import 'package:flutter/material.dart';
import 'package:login_page/utils/shape_transition_controller.dart';
import 'package:simple_animations/simple_animations.dart';

class ShapeTransition extends StatefulWidget {
  final Widget child;
  final Function onFinish;
  final ShapeTransitionController controller;
  final Color? color;
  const ShapeTransition(
      {Key? key,
      required this.child,
      required this.onFinish,
      required this.controller,
      this.color})
      : super(key: key);

  @override
  State<ShapeTransition> createState() => _ShapeTransitionState();
}

class _ShapeTransitionState extends State<ShapeTransition> {
  double posx = 0;
  double posy = 0;
  bool play = false;
  AnimationStatus status = AnimationStatus.forward;

  void onTapDown(BuildContext context, TapDownDetails details) {
    final RenderBox box = context.findRenderObject()! as RenderBox;
    final Offset localOffset = box.globalToLocal(details.globalPosition);

    setState(() {
      posx = localOffset.dx;
      posy = localOffset.dy;
      print("down ${posx} ${posy}");
    });
  }

  void onTapUp(BuildContext context, TapUpDetails details) {
    final RenderBox box = context.findRenderObject()! as RenderBox;
    final Offset localOffset = box.globalToLocal(details.globalPosition);
    setState(() {
      posx = localOffset.dx;
      posy = localOffset.dy;
      play = true;
      print("up ${posx} ${posy}");
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => print('tapped!'),
      onTapDown: (TapDownDetails details) => onTapDown(context, details),
      onTapUp: (TapUpDetails details) => onTapUp(context, details),
      child: Stack(fit: StackFit.expand, children: <Widget>[
        widget.child,
        (widget.controller.finish && play)
            ? Positioned(
                left: posx - 50,
                top: posy - 50,
                child: CustomAnimation<double>(
                  control: widget.controller.control,
                  tween: Tween(
                      begin: 0,
                      end: (height + posy) /
                          100.0), // value for offset x-coordinate
                  duration: const Duration(seconds: 2),
                  curve: Curves.easeOutQuint, // non-linear animation
                  builder: (context, child, value) {
                    // var s = value*100.0;
                    // if(s > 100) {
                    //   s = 100;
                    // }
                    return Transform.scale(
                      scale: value,
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            color: (widget.color != null)
                                ? widget.color
                                : Colors.white,
                            shape: BoxShape.circle),
                      ),
                    );
                  },
                  animationStatusListener: (_status) {
                    if (_status != AnimationStatus.completed) {
                      status = _status;
                    }
                  },
                  onComplete: () {
                    if (status == AnimationStatus.forward) {
                      widget.onFinish();
                    }
                  },
                ),
              )
            : SizedBox()
      ]),
    );
  }
}
