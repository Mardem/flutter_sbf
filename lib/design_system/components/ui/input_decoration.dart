import 'package:flutter/material.dart';

InputDecoration inputDecoration({
  required String hint,
  Color? fillColor,
  Widget? suffixIcon,
  double radius = 3,
}) {
  return InputDecoration(
    border: InputBorder.none,
    hintText: ' $hint',
    hintStyle: const TextStyle(
      fontStyle: FontStyle.italic,
    ),
    filled: true,
    suffixIcon: suffixIcon,
    contentPadding: const EdgeInsets.only(top: 13, left: 8),
    fillColor: fillColor ?? Colors.grey.withOpacity(.2),
    floatingLabelBehavior: FloatingLabelBehavior.never,
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent, width: 0),
      borderRadius: BorderRadius.circular(radius),
    ),
    errorBorder: UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent, width: 0),
      borderRadius: BorderRadius.circular(radius),
    ),
    focusedErrorBorder: UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent, width: 0),
      borderRadius: BorderRadius.circular(radius),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent, width: 0),
      borderRadius: BorderRadius.circular(radius),
    ),
    disabledBorder: UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent, width: 0),
      borderRadius: BorderRadius.circular(radius),
    ),
  );
}
