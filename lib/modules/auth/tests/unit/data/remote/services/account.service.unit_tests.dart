import 'package:flutter_sbf/core/di/components/remote/http_client.dart';
import 'package:flutter_sbf/core/di/components/remote/response.dart';
import 'package:flutter_sbf/core/di/inject.dart';
import 'package:flutter_sbf/modules/auth/src/data/remote/mappers/inser_register.mapper.dart';
import 'package:flutter_sbf/modules/auth/src/data/remote/mappers/login.mapper.dart';
import 'package:flutter_sbf/modules/auth/src/data/remote/services/account.service.dart';
import 'package:flutter_sbf/modules/auth/tests/fixtures/data/remote/services/account.service.fixture.dart';
import 'package:flutter_sbf/modules/auth/tests/mocks/data/remote/http/http_client_account.fake.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  group('Test valid Http Login', () {
    late AccountService service;

    setUpAll(() {
      inject.registerFactory<HttpClient>(
        () => MockHttpClientValidLoginResponse(),
      );
      service = AccountServiceImpl();
    });

    tearDownAll(() {
      inject.unregister<HttpClient>();
    });

    test('Given_UserAccessData_When_TheUserAccessWithCredentials_Then_LoginIsSuccessfully',
        () async {
      // Given
      String email = AccountServiceFixture.email;
      String password = AccountServiceFixture.password;

      // When
      HttpResponse<LoginMapper?> res = await service.login(
        email: email,
        password: password,
      );

      // Then
      expect(res, isA<HttpResponse<LoginMapper?>>());
      expect(res.data, isA<LoginMapper>());
      expect(res.isSuccess, isTrue);
      expect(res.message, equals(AccountServiceMessages.success));
      expect(res.statusCode, equals(HttpStatus.success));
    });
  });

  group('Test Invalid Http Login', () {
    late AccountService service;

    setUpAll(() {
      inject.registerFactory<HttpClient>(
        () => MockHttpClientInvalidLoginResponse(),
      );
      service = AccountServiceImpl();
    });

    tearDownAll(() {
      inject.unregister<HttpClient>();
    });

    test('Given_UserAccessData_When_TheUserAccessWithCredentials_Then_ReturnError', () async {
      // Given
      String email = AccountServiceFixture.email;
      String password = AccountServiceFixture.password;

      // When
      HttpResponse<LoginMapper?> res = await service.login(
        email: email,
        password: password,
      );

      // Then
      expect(res, isA<HttpResponse<LoginMapper?>>());
      expect(res.data, isNull);
      expect(res.isSuccess, isFalse);
      expect(res.message, equals(AccountServiceMessages.error));
      expect(res.statusCode, equals(HttpStatus.serverError));
    });
  });

  /// =------------------=
  ///    Register tests
  /// =------------------=
  group('Test Valid Http Register', () {
    late AccountService service;

    setUpAll(() {
      inject.registerFactory<HttpClient>(
        () => MockHttpClientValidLoginResponse(),
      );
      service = AccountServiceImpl();
    });

    tearDownAll(() {
      inject.unregister<HttpClient>();
    });

    test('Given_UserRegisterData_When_TheUserWillRegister_Then_RegisterIsSuccessfully', () async {
      // Given
      InsertRegisterMapper userData = AccountServiceFixture.registerFake();

      // When
      HttpResponse res = await service.register(user: userData);

      // Then
      expect(res, isA<HttpResponse>());
      expect(res.isSuccess, isTrue);
      expect(res.message, equals(AccountServiceMessages.successRegister));
      expect(res.statusCode, equals(HttpStatus.success));
    });
  });

  group('Test Invalid Http Register', () {
    late AccountService service;

    setUpAll(() {
      inject.registerFactory<HttpClient>(
        () => MockHttpClientInvalidLoginResponse(),
      );
      service = AccountServiceImpl();
    });

    tearDownAll(() {
      inject.unregister<HttpClient>();
    });

    test('Given_UserRegisterData_When_TheUserWillRegister_Then_RegisterIsFail', () async {
      // Given
      InsertRegisterMapper userData = AccountServiceFixture.registerFake();

      // When
      HttpResponse res = await service.register(user: userData);

      // Then
      expect(res, isA<HttpResponse>());
      expect(res.data, isNull);
      expect(res.isSuccess, isFalse);
      expect(res.message, equals(AccountServiceMessages.errorRegister));
      expect(res.statusCode, equals(HttpStatus.serverError));
    });
  });
}
