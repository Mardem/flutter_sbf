import 'package:flutter_sbf/core/routes/routes.dart';
import 'package:flutter_sbf/modules/home/src/presentation/home/home.page.dart';

final routeHome = AppRoute(
  name: '/home',
  direction: NavigationType.fromLeft,
  page: const HomePage(),
);

final List<AppRoute> routesHomeModule = [
  routeHome,
];
