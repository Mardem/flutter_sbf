import 'package:flutter_sbf/core/routes/routes.dart';

import 'src/presentation/home/cart.page.dart';

final AppRoute routeCart = AppRoute(
  name: '/cart',
  direction: NavigationType.FROM_LEFT,
  page: const CartPage(),
);

final List<AppRoute> routesCartModule = <AppRoute>[
  routeCart,
];
