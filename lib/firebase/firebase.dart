import 'package:firebase_core/firebase_core.dart';

class FirebaseCoreService {
  Future<void> initialize() async {
    await Firebase.initializeApp();
  }
}
