import 'package:flutter_sbf/core/routes/routes.dart';

import 'src/presentation/configuration/configuration.page.dart';

final routeSmsConfig = AppRoute(
  name: '/sms/config',
  direction: NavigationType.fromLeft,
  page: const ConfigSmsPage(),
);

final List<AppRoute> routesSmsModule = [
  routeSmsConfig,
];
