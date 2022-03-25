import 'package:flutter_sbf/core/di/components/local/local_storage.dart';
import 'package:flutter_sbf/core/di/components/remote/response.dart';
import 'package:flutter_sbf/core/di/inject.dart';
import 'package:flutter_sbf/modules/auth/src/data/local/account_local.service.dart';
import 'package:flutter_sbf/modules/auth/src/data/remote/mappers/login.mapper.dart';
import 'package:flutter_sbf/modules/auth/tests/fixtures/data/local/account_local.service.dart';
import 'package:flutter_sbf/modules/auth/tests/mocks/data/local/local_storage.account.fake.dart';
import 'package:flutter_sbf/modules/auth/tests/mocks/data/local/local_storage.fake.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  ///
  /// ---- storeUserData()
  ///

  group('Test valid on storage user data', () {
    late AccountServiceLocal service;

    setUpAll(() {
      inject.registerFactory<LocalStorage>(
        () => MockLocalStorageAccountValid(),
      );

      service = AccountServiceLocalImpl();
    });

    tearDownAll(() {
      inject.unregister<LocalStorage>();
    });

    test('Given_UserDataReceived_When_StoreUserData_Then_StoresSuccessfully', () async {
      // Given
      Map<String, dynamic> userData = AccountLocalServiceFixture.validJson;

      // When
      HttpResponse res = service.storeUserData(userData: userData);

      // Then
      expect(res, isA<HttpResponse>());
      expect(res.isSuccess, isTrue);
      expect(res.message, equals(AccountServiceLocalMessage.success));
    });
  });

  group('Test exception on storage user data', () {
    late AccountServiceLocal service;

    setUpAll(() {
      inject.registerFactory<LocalStorage>(
        () => MockLocalStorageError(),
      );

      service = AccountServiceLocalImpl();
    });

    tearDownAll(() {
      inject.unregister<LocalStorage>();
    });

    test('Given_UserDataReceived_When_StoreUserData_Then_ReturnAException', () async {
      // Given
      Map<String, dynamic> userData = AccountLocalServiceFixture.validJson;

      // When
      HttpResponse res = service.storeUserData(userData: userData);

      // Then
      expect(res, isA<HttpResponse>());
      expect(res.isSuccess, isFalse);
      expect(res.message, equals(AccountServiceLocalMessage.error));
    });
  });

  ///
  /// ---- keepConnected()
  ///

  group('Test valid on storage keep connected', () {
    late AccountServiceLocal service;

    setUpAll(() {
      inject.registerFactory<LocalStorage>(
        () => MockLocalStorageAccountValid(),
      );

      service = AccountServiceLocalImpl();
    });

    tearDownAll(() {
      inject.unregister<LocalStorage>();
    });

    test('Given_KeepConnectedDataReceived_When_StoreData_Then_StoresSuccessfully', () async {
      // Given
      bool keepConnected = AccountLocalServiceFixture.keepConnected;

      // When
      HttpResponse res = service.keepConnected(status: keepConnected);

      // Then
      expect(res, isA<HttpResponse>());
      expect(res.isSuccess, isTrue);
      expect(res.message, equals(AccountServiceLocalMessage.success));
    });
  });

  group('Test exception on storage keep connected', () {
    late AccountServiceLocal service;

    setUpAll(() {
      inject.registerFactory<LocalStorage>(
        () => MockLocalStorageError(),
      );

      service = AccountServiceLocalImpl();
    });

    tearDownAll(() {
      inject.unregister<LocalStorage>();
    });

    test('Given_KeepConnectedDataReceived_When_StoreData_Then_ReturnAException', () async {
      // Given
      bool keepConnected = AccountLocalServiceFixture.keepConnected;

      // When
      HttpResponse res = service.keepConnected(status: keepConnected);

      // Then
      expect(res, isA<HttpResponse>());
      expect(res.isSuccess, isFalse);
      expect(res.message, equals(AccountServiceLocalMessage.error));
    });
  });

  ///
  /// ---- getUserData()
  ///

  group('Test valid on get user data and decode local data', () {
    late AccountServiceLocal service;

    setUpAll(() {
      inject.registerFactory<LocalStorage>(
        () => MockLocalStorageAccountValid(),
      );

      service = AccountServiceLocalImpl();
    });

    tearDownAll(() {
      inject.unregister<LocalStorage>();
    });

    test('Given_UserDataReceived_When_StoreData_Then_StoresSuccessfully', () async {
      // Given
      String message = AccountServiceLocalMessage.successDecode;

      // When
      HttpResponse<LoginMapper?> res = await service.getUserData();

      // Then
      expect(res, isA<HttpResponse<LoginMapper?>>());
      expect(res.isSuccess, isTrue);
      expect(res.data, isNotNull);
      expect(res.statusCode, equals(HttpStatus.success));
      expect(res.message, equals(message));
    });
  });

  group('Test error on get user data', () {
    late AccountServiceLocal service;

    setUpAll(() {
      inject.registerFactory<LocalStorage>(
        () => MockLocalStorageInvalid(),
      );

      service = AccountServiceLocalImpl();
    });

    tearDownAll(() {
      inject.unregister<LocalStorage>();
    });

    test('Given_KeepConnectedDataReceived_When_StoreData_Then_ReturnAException', () async {
      // Given
      String message = AccountServiceLocalMessage.errorDecode;

      // When
      HttpResponse<LoginMapper?> res = await service.getUserData();

      // Then
      expect(res, isA<HttpResponse<LoginMapper?>>());
      expect(res.isSuccess, isFalse);
      expect(res.message, equals(message));
    });
  });
}
