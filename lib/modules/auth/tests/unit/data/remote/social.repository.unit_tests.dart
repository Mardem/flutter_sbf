import 'package:flutter_sbf/core/di/inject.dart';
import 'package:flutter_sbf/firebase/src/auth/social_info.dart';
import 'package:flutter_sbf/modules/auth/src/data/remote/services/google.service.dart';
import 'package:flutter_sbf/modules/auth/src/domain/repository/social.repository.dart';
import 'package:flutter_sbf/modules/auth/tests/mocks/data/remote/services/google.service.fake.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  ///
  /// Valid test
  ///
  group('Test valid social login from repository', () {
    late SocialRepository socialRepository;
    late GoogleAuthService serviceProvider;

    setUpAll(() {
      serviceProvider = MockGoogleAuthServiceValid();

      inject.registerFactory<GoogleAuthService>(() => serviceProvider);

      socialRepository = SocialRepository();
    });

    tearDownAll(() {
      inject.unregister<GoogleAuthService>();
    });

    test('Given_UserLogin_When_TheUserWillLogin_Then_LoginIsSuccessful', () async {
      // Given
      socialRepository.setProvider(serviceProvider);
      // When
      SocialInfo res = await socialRepository.login();

      // Then
      expect(res, isA<SocialInfo>());
      expect(res.name, isNotNull);
      expect(res.email, isNotNull);
      expect(res.success, isTrue);
      expect(res.message, isNotNull);
    });
  });

  ///
  /// Invalid test
  ///
  group('Test invalid social login from repository', () {
    late SocialRepository socialRepository;

    setUpAll(() {
      inject.registerFactory<GoogleAuthService>(() => MockGoogleAuthServiceValid());

      socialRepository = SocialRepository();
    });

    tearDownAll(() {
      inject.unregister<GoogleAuthService>();
    });

    test('Given_UserLogin_When_TheUserWillLogin_Then_LoginWillReturnExceptionBecauseProvider',
        () async {
      // Given
      // When
      SocialInfo res = await socialRepository.login();

      // Then
      expect(res, isA<SocialInfo>());
      expect(res.name, equals('...'));
      expect(res.email, equals('...'));
      expect(res.success, isFalse);
      expect(res.loginType, equals('ERROR'));
    });
  });

  /// Google Login
  group('Testing Set Provider', () {
    late SocialRepository socialRepository;
    late GoogleAuthService serviceProvider;

    setUpAll(() {
      serviceProvider = MockGoogleAuthServiceValid();

      inject.registerFactory<GoogleAuthService>(() => serviceProvider);

      socialRepository = SocialRepository();
    });

    tearDownAll(() {
      inject.unregister<GoogleAuthService>();
    });

    test('Given_TheRepositorySetProvider_When_ItIsCalled_Then_RepositoryReturnsNormally', () async {
      // Given
      // When
      // Then
      expect(() => socialRepository.setProvider(serviceProvider), returnsNormally);
    });
  });
}
