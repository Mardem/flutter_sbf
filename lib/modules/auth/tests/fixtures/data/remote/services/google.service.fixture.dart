import 'package:flutter_sbf/firebase/src/auth/login_types.dart';
import 'package:flutter_sbf/firebase/src/auth/social_info.dart';

class GoogleServiceValid {
  static SocialInfo login() {
    SocialInfo info = SocialInfo();

    return info
      ..success = true
      ..email = 'pedro@pedepronto'
      ..name = 'Pedro da Silva Costa'
      ..message = 'Usuário autenticado!'
      ..loginType = LoginType.google;
  }
}

class GoogleServiceInvalid {
  static SocialInfo invalid() {
    SocialInfo info = SocialInfo();

    return info
      ..success = false
      ..message = info.translateErrors('invalid-credential')
      ..loginType = LoginType.google;
  }
}
