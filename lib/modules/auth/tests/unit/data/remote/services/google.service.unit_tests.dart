import 'package:flutter_sbf/core/di/inject.dart';
import 'package:flutter_sbf/firebase/src/auth/google.bridge.dart';
import 'package:flutter_sbf/firebase/src/auth/social_info.dart';
import 'package:flutter_sbf/firebase/tests/unit/mocks/data/google.bridge.fake.dart';
import 'package:flutter_sbf/modules/auth/src/data/remote/services/google.service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Testing valid Google Service', () {
    late GoogleAuthService googleService;

    setUpAll(() {
      inject.registerFactory<GoogleAuthBridge>(() => MockGoogleBridgeValid());
      googleService = GoogleAuthServiceImpl();
    });

    tearDownAll(() {
      inject.unregister<GoogleAuthBridge>();
    });

    test('Given_GoogleLogin_When_TheUserWillLogin_Then_LoginIsSuccessful', () async {
      // Given
      //When
      SocialInfo info = await googleService.login();

      // Then
      expect(await googleService.login(), isA<SocialInfo>());
      expect(info.success, isTrue);
      expect(info.message, equals('Usuário autenticado!'));
      expect(info.loginType, equals('GOOGLE'));
      expect(info.email, isNotNull);
      expect(info.name, isNotNull);
    });
  });

  group('Testing error Google Service', () {
    late GoogleAuthService googleService;

    setUpAll(() {
      inject.registerFactory<GoogleAuthBridge>(
        () => MockGoogleBridgeException(),
      );
      googleService = GoogleAuthServiceImpl();
    });

    tearDownAll(() {
      inject.unregister<GoogleAuthBridge>();
    });

    test('Given_GoogleLogin_When_TheUserWillLogin_Then_LoginThrowError', () async {
      // Given
      //When
      SocialInfo info = await googleService.login();

      // Then
      expect(await googleService.login(), isA<SocialInfo>());
      expect(info.success, isFalse);
      expect(info.email, equals('...'));
      expect(info.name, equals('...'));
    });
  });
}
