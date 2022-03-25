import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_sbf/core/di/inject.dart';
import 'package:flutter_sbf/firebase/src/auth/google.bridge.dart';
import 'package:flutter_sbf/firebase/src/auth/login_types.dart';
import 'package:flutter_sbf/firebase/src/auth/mapper/google_signin.mapper.dart';
import 'package:flutter_sbf/firebase/src/auth/social_info.dart';
import 'package:flutter_sbf/modules/auth/src/domain/interactor/social.interactor.dart';

abstract class GoogleAuthService implements SocialLogin {}

class GoogleAuthServiceImpl implements GoogleAuthService {
  final loggerKey = 'Google AuthService::: ';

  final googleAuthBridge = inject<GoogleAuthBridge>();
  SocialInfo socialInfo = SocialInfo(loginType: LoginType.google);

  @override
  Future<SocialInfo> login() async {
    try {
      GoogleSignInUserDetails? user = await googleAuthBridge.signIn();

      return socialInfo
        ..success = true
        ..message = 'Usuário autenticado!'
        ..name = user!.name
        ..email = user.email;
    } on FirebaseAuthException catch (e) {
      String message = socialInfo.translateErrors(e.code);

      return socialInfo
        ..success = false
        ..message = message;
    } on Exception catch (e) {
      return socialInfo
        ..success = false
        ..message = e.toString();
    }
  }

  @override
  logout() async {
    bool loginActive = await googleAuthBridge.isSignedIn();

    if (loginActive) {
      await googleAuthBridge.disconnect();
      await googleAuthBridge.signOut();
    }
  }

  @override
  LoginType loginType() {
    return LoginType.google;
  }
}
