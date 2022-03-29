import 'package:flutter/material.dart';
import 'package:flutter_sbf/core/views/page_not_found.page.dart';
import 'package:flutter_sbf/modules/cart/routes.dart';
import 'package:flutter_sbf/modules/home/routes.dart';
import 'package:flutter_sbf/modules/splash/routes.dart';

import 'anim/nav_no_animation.dart';
import 'anim/nav_slide_from_bottom.dart';
import 'anim/nav_slide_from_left.dart';
import 'anim/nav_slide_from_right.dart';
import 'anim/nav_slide_from_top.dart';

///////////////////////////////////////////////////////////
// ADD NEW MODULE ROUTES HERE /////////////////////////////
///////////////////////////////////////////////////////////

final List<AppRoute> routes = <AppRoute>[
  ...routesHomeModule,
  ...routesCartModule,
  ...routesSplashModule,
];

///////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////

enum NavigationType { FROM_BOTTOM, FROM_TOP, FROM_RIGHT, FROM_LEFT, NO_ANIMATION }

class AppRoute {
  AppRoute({
    this.name = '/',
    this.direction = NavigationType.NO_ANIMATION,
    this.page,
  });

  final String name;
  final NavigationType? direction;
  Widget? page = Container();
}

class RouteGenerator {
  const RouteGenerator();
  static Route<dynamic> generateRoute(RouteSettings settings) {
    for (final AppRoute route in routes) {
      if (settings.name == route.name) {
        final Widget page = route.page ?? Container();
        final NavigationType direction = route.direction ?? NavigationType.NO_ANIMATION;

        switch (direction) {
          case NavigationType.NO_ANIMATION:
            return NavNoAnimation(page: page, settings: settings);
          case NavigationType.FROM_TOP:
            return NavSlideFromTop(page: page, settings: settings);
          case NavigationType.FROM_BOTTOM:
            return NavSlideFromBottom(page: page, settings: settings);
          case NavigationType.FROM_RIGHT:
            return NavSlideFromRight(page: page, settings: settings);
          case NavigationType.FROM_LEFT:
            return NavSlideFromLeft(page: page, settings: settings);
        }
      }
    }

    return NavNoAnimation(page: const PageNotFoundPage());
  }
}
