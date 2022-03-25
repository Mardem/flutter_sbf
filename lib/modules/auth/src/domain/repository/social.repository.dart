import 'package:flutter_sbf/firebase/src/auth/login_types.dart';
import 'package:flutter_sbf/firebase/src/auth/social_info.dart';
import 'package:flutter_sbf/modules/auth/src/domain/interactor/social.interactor.dart';

class SocialRepository implements SocialLoginInteractor {
  SocialLogin? _provider;

  @override
  Future<SocialInfo> login() async {
    try {
      if (_provider == null) {
        throw UnimplementedError(
          'Para realizar o login social é necessário configurar um provider',
        );
      }

      SocialInfo info = await _provider!.login();

      return info;
    } catch (e) {
      SocialInfo socialInfo = SocialInfo();
      return socialInfo
        ..success = false
        ..loginType = LoginType.error
        ..message = 'Não foi possível realizar o login social!';
    }
  }

  @override
  Future<void> logout() async {
    await _provider!.logout();
  }

  @override
  void setProvider(SocialLogin socialProvider) {
    _provider = socialProvider;
  }
}
