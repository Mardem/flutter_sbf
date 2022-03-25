import 'package:flutter_sbf/core/routes/routes.dart';
import 'package:flutter_sbf/modules/example/src/presentation/example/example.page.dart';

final AppRoute routeExample = AppRoute(
  name: '/login',
  direction: NavigationType.FROM_LEFT,
  page: const ExamplePage(),
);

final List<AppRoute> routesExampleModule = <AppRoute>[
  routeExample,
];
