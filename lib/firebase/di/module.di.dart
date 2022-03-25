import 'package:flutter_sbf/core/di/inject.dart';
import 'package:flutter_sbf/firebase/src/auth/google.bridge.dart';

import '../firebase.dart';

Future<void> startFirebaseModule() async {
  //Firebase Core
  final firebase = FirebaseCoreService();
  await firebase.initialize();

  inject.registerSingleton<FirebaseCoreService>(firebase);

  inject.registerFactory<GoogleAuthBridge>(() => GoogleAuthBridgeImpl());
}
