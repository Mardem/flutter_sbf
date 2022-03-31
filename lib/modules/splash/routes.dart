import 'package:flutter_sbf/core/routes/routes.dart';
import 'package:flutter_sbf/modules/splash/src/presentation/splashscreen/splashscreen.page.dart';

final AppRoute routeSplash = AppRoute(
  name: '/splashscreen',
  direction: NavigationType.FROM_LEFT,
  page: const SplashPage(),
);

final List<AppRoute> routesSplashModule = <AppRoute>[
  routeSplash,
];
