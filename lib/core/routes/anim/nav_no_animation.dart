import 'package:flutter/material.dart';

class NavNoAnimation extends PageRouteBuilder<dynamic> {
  NavNoAnimation({required this.page, RouteSettings? settings})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: Offset.zero,
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
          settings: settings,
        );

  final Widget page;
}
