import 'package:flutter/material.dart';

class AppInput extends StatelessWidget {
  const AppInput({Key? key, required this.decoration}) : super(key: key);

  final InputDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: decoration,
    );
  }
}
