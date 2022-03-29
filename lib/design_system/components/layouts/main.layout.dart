import 'package:flutter/material.dart';
import 'package:flutter_sbf/design_system/components/ui/app_logo_bottom.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({
    required this.child,
    this.activeBack = false,
    this.activeBottomLogo = false,
    Key? key,
  }) : super(key: key);

  final bool activeBack;
  final bool activeBottomLogo;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.onPrimary,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: child,
          bottomNavigationBar: activeBottomLogo
              ? const SizedBox(
                  height: 60,
                  child: AppLogoBottom(),
                )
              : null,
        ),
      ),
    );
  }
}
