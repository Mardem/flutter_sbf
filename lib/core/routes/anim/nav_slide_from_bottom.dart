import 'package:flutter/material.dart';

class NavSlideFromBottom extends PageRouteBuilder<dynamic> {
  NavSlideFromBottom({required this.page, RouteSettings? settings})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return page;
          },
          transitionDuration: const Duration(milliseconds: 450),
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.0, 1.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
          settings: settings,
        );

  final Widget page;
}
