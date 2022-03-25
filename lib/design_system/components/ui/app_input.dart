import 'package:flutter/material.dart';

class AppInput extends StatelessWidget {
  final InputDecoration? decoration;

  const AppInput({Key? key, required this.decoration}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: decoration,
    );
  }
}
