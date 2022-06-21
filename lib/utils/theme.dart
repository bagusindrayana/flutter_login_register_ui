import 'package:flutter/material.dart';

class ThemeApp {
  List<Color> _colors = [
    Color(0xFFFF6363),
    Color(0xFFF89999),
  ];

  static const _durations = [
    8000,
    7000,
  ];

  static const _heightPercentages = [
    0.3,
    0.35,
  ];

  List<Color> get colors {
    return _colors;
  }

  List<int> get durations {
    return _durations;
  }

  List<double> get heightPercentages {
    return _heightPercentages;
  }
}
