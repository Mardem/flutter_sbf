import 'package:flutter_sbf/core/routes/routes.dart';
import 'package:flutter_sbf/modules/example/src/presentation/example/example.page.dart';

final routeExample = AppRoute(
  name: '/login',
  direction: NavigationType.fromLeft,
  page: const ExamplePage(),
);

final List<AppRoute> routesExampleModule = [
  routeExample,
];
