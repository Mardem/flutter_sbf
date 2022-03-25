import 'package:flutter_sbf/core/routes/routes.dart';
import 'package:flutter_sbf/modules/splash/src/presentation/splashscreen/splashscreen.page.dart';

final routeSplash = AppRoute(
  name: '/splashscreen',
  direction: NavigationType.fromLeft,
  page: const SplashPage(),
);

final List<AppRoute> routesSplashModule = [
  routeSplash,
];
