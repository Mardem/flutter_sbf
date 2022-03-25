import 'package:flutter/material.dart';

class NavFade<T> extends PageRouteBuilder<T> {
  NavFade({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation1,
            Animation<double> animation2,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation1,
            Animation<double> animation2,
            Widget child,
          ) {
            return FadeTransition(opacity: animation1, child: child);
          },
        );

  final Widget page;
}
