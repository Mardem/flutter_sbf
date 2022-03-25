import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppText extends StatelessWidget {
  final String text;
  final Color? color;
  final Color? backgroundColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;

  const AppText({
    Key? key,
    required this.text,
    this.color,
    this.backgroundColor,
    this.fontSize,
    this.fontWeight,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.openSans(
        fontWeight: fontWeight,
        color: color,
        backgroundColor: backgroundColor,
        fontSize: fontSize,
      ),
    );
  }
}
