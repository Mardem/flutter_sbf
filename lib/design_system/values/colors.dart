import 'package:flutter/material.dart';

abstract class DefaultColors {
  static const Color backgroundColor = Color.fromRGBO(232, 235, 246, 1.0);
  static const Color defaultBlue = Color.fromRGBO(59, 92, 184, 1.0);
  static const Color defaultGrey = Color.fromRGBO(120, 123, 140, 1.0);
  static const Color defaultPurple = Color.fromRGBO(65, 83, 141, 1.0);

  static const Color accentBlue = Color.fromRGBO(213, 236, 251, 1.0);

  static const Color snackBarInfoColor = Colors.blueAccent;
  static const Color snackBarSuccessColor = Colors.green;
  static const Color snackBarErrorColor = Colors.redAccent;

  /// App Colors
  static const Color brand = Color.fromRGBO(227, 0, 0, 1);
  static const Color neutral = Color.fromRGBO(247, 247, 247, 1);
  static const Color neutral300 = Color.fromRGBO(214, 214, 214, 1);
  static const Color neutral600 = Color.fromRGBO(77, 77, 77, 1);

  static const Color shimmerBaseColor = Color(0xFFD4D2D6);
  static const Color shimmerHighlightColor = Color(0xFFF5F5F5);
}
