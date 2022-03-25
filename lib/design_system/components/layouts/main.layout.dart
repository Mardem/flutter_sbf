import 'package:flutter/material.dart';

class MainLayout extends StatelessWidget {
  final bool activeBack;

  const MainLayout({
    this.activeBack = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(),
        ),
      ),
    );
  }
}
