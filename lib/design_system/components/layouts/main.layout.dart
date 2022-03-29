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
    return Container(
      color: Theme.of(context).colorScheme.onPrimary,
      child: SafeArea(
        child: Scaffold(
          body: child,
        ),
      ),
    );
  }
}
