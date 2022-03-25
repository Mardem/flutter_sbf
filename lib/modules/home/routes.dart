import 'package:flutter_sbf/core/routes/routes.dart';
import 'package:flutter_sbf/modules/home/src/presentation/home/home.page.dart';

final AppRoute routeHome = AppRoute(
  name: '/home',
  direction: NavigationType.FROM_LEFT,
  page: const HomePage(),
);

final List<AppRoute> routesHomeModule = <AppRoute>[
  routeHome,
];
