import 'package:get_it/get_it.dart';
import 'package:flutter_sbf/core/di/components/local/local_storage.dart';
import 'package:flutter_sbf/firebase/di/module.di.dart';
import 'package:flutter_sbf/modules/auth/di/module.di.dart';
import 'package:flutter_sbf/modules/home/di/module.di.dart';
import 'package:flutter_sbf/modules/sms/di/module.di.dart';

import 'components/remote/http_client.dart';

final GetIt inject = GetIt.I;

Future<void> startModules() async {
  inject.registerLazySingleton<HttpClient>(() => DioImpl());
  inject.registerSingleton<LocalStorage>(SharePreferencesImpl());

  /// Firebase modules
  await startFirebaseModule();
  startAuthModule();
  startHomeModules();
  startSmsModule();
}
