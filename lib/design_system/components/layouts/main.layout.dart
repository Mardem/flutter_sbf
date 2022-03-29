import 'package:flutter/material.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({
    required this.child,
    this.activeBack = false,
    Key? key,
  }) : super(key: key);

  final bool activeBack;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: child,
      ),
    );
  }
}
