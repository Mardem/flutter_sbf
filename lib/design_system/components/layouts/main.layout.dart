import 'package:flutter/material.dart';
import 'package:flutter_sbf/design_system/components/ui/app_header.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({
    this.activeBack = false,
    Key? key,
  }) : super(key: key);

  final bool activeBack;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: const <Widget>[
              AppHeader(),
            ],
          ),
        ),
      ),
    );
  }
}
