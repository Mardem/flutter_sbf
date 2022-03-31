import 'package:flutter_sbf/core/di/components/local/local_storage.dart';
import 'package:flutter_sbf/core/utils/connection.util.dart';
import 'package:flutter_sbf/modules/cart/di/module.di.dart';
import 'package:flutter_sbf/modules/home/di/module.di.dart';
import 'package:get_it/get_it.dart';

import 'components/remote/http_client.dart';

final GetIt inject = GetIt.I;

Future<void> startModules() async {
  inject.registerLazySingleton<HttpClient>(() => DioImpl());
  inject.registerSingleton<LocalStorage>(SharePreferencesImpl());
  inject.registerSingleton<ConnectionUtil>(ConnectionUtil());

  startHomeModules();
  startCartModules();
}
