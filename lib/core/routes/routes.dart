import 'package:flutter/material.dart';
import 'package:flutter_sbf/core/views/page_not_found.page.dart';
import 'package:flutter_sbf/modules/home/routes.dart';
import 'package:flutter_sbf/modules/splash/routes.dart';

import 'anim/nav_no_animation.dart';
import 'anim/nav_slide_from_bottom.dart';
import 'anim/nav_slide_from_left.dart';
import 'anim/nav_slide_from_right.dart';
import 'anim/nav_slide_from_top.dart';

/// Set new routes below
final List<AppRoute> routes = [
  ...routesHomeModule,
  ...routesSplashModule,
];

enum NavigationType { fromBottom, fromTop, fromRight, fromLeft, noAnimation }

class AppRoute {
  final String name;
  final NavigationType? direction;
  Widget? page = Container();

  AppRoute({
    this.name = "/",
    this.direction = NavigationType.noAnimation,
    this.page,
  });
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    for (AppRoute r in routes) {
      if (settings.name == r.name) {
        Widget page = r.page ?? Container();
        NavigationType direction = r.direction ?? NavigationType.noAnimation;

        switch (direction) {
          case NavigationType.noAnimation:
            return NavNoAnimation(page: page);
          case NavigationType.fromTop:
            return NavSlideFromTop(page: page);
          case NavigationType.fromBottom:
            return NavSlideFromBottom(page: page);
          case NavigationType.fromRight:
            return NavSlideFromRight(page: page);
          case NavigationType.fromLeft:
            return NavSlideFromLeft(page: page);
        }
      }
    }

    return NavNoAnimation(page: const PageNotFoundPage());
  }
}
