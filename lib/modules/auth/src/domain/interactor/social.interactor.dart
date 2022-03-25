import 'package:flutter_sbf/core/di/inject.dart';
import 'package:flutter_sbf/firebase/src/auth/login_types.dart';
import 'package:flutter_sbf/firebase/src/auth/social_info.dart';
import 'package:flutter_sbf/modules/auth/src/domain/repository/social.repository.dart';

abstract class SocialLoginInteractor {
  Future<SocialInfo> login();
  Future<void> logout();
  void setProvider(SocialLogin provider);
}

abstract class SocialLogin {
  Future<SocialInfo> login();
  Future<void> logout();
  LoginType loginType();
}

class SocialLoginImpl implements SocialLoginInteractor {
  final _repository = inject<SocialRepository>();

  @override
  Future<SocialInfo> login() async {
    try {
      return await _repository.login();
    } catch (_) {
      return SocialInfo(loginType: LoginType.error);
    }
  }

  @override
  Future<void> logout() {
    return _repository.logout();
  }

  @override
  void setProvider(SocialLogin provider) {
    return _repository.setProvider(provider);
  }
}
