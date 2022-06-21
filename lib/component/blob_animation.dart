import 'package:blobs/blobs.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'dart:math' as math;

class BlobAnimation extends StatelessWidget {
  final double blobSize;
  final Color blobColor;
  final Duration animDuration;
  const BlobAnimation(
      {Key? key,
      required this.blobSize,
      required this.blobColor,
      required this.animDuration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoopAnimation<double?>(
        tween: Tween(begin: 0, end: 360), // define tween
        duration: animDuration, // define duration
        builder: (context, child, value) {
          return Transform.rotate(
            angle: value! * math.pi / 180,
            child: Align(
              alignment: Alignment.center,
              child: Blob.fromID(
                  styles: BlobStyles(color: blobColor),
                  size: blobSize,
                  id: ['8-7-9577']),
            ),
          );
        });
  }
}
