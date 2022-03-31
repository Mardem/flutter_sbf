import 'package:flutter/material.dart';

class NavSlideFromLeft extends PageRouteBuilder<dynamic> {
  NavSlideFromLeft({required this.page, RouteSettings? settings})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return page;
          },
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return SlideTransition(
              position: Tween<Offset>(begin: const Offset(-1.0, 0.0), end: Offset.zero)
                  .animate(animation),
              child: child,
            );
          },
          settings: settings,
        );

  final Widget page;
}
