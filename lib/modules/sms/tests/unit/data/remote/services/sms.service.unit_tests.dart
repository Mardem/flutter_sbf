import 'package:flutter_sbf/core/di/components/remote/http_client.dart';
import 'package:flutter_sbf/core/di/components/remote/response.dart';
import 'package:flutter_sbf/core/di/inject.dart';
import 'package:flutter_sbf/modules/auth/tests/mocks/data/remote/http_client.fake.dart';
import 'package:flutter_sbf/modules/sms/src/data/remote/mappers/insert_sms_provider.mapper.dart';
import 'package:flutter_sbf/modules/sms/src/data/remote/services/sms.service.dart';
import 'package:flutter_sbf/modules/sms/tests/fixtures/data/remote/services/sms.service.fixture.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  group('Test valid provider register', () {
    late SmsService service;

    setUpAll(() {
      inject.registerFactory<HttpClient>(
        () => MockHttpClientValidResponse(),
      );
      service = SmsServiceImpl();
    });

    tearDownAll(() {
      inject.unregister<HttpClient>();
    });

    test('Given_ProviderInfo_When_TheUserWillRegister_Then_RegisterIsSuccessfully', () async {
      // Given
      InsertSmsProviderMapper provider = SmsFixtureValid.generateProvider();

      // When
      HttpResponse res = await service.save(info: provider);

      // Then
      expect(res, isA<HttpResponse>());
      expect(res.isSuccess, isTrue);
      expect(res.message, equals(SmsServiceMessages.success));
      expect(res.statusCode, equals(HttpStatus.success));
    });
  });

  group('Test Invalid Http Login', () {
    late SmsService service;

    setUpAll(() {
      inject.registerFactory<HttpClient>(
        () => MockHttpClientInvalidResponse(),
      );
      service = SmsServiceImpl();
    });

    tearDownAll(() {
      inject.unregister<HttpClient>();
    });

    test('Given_ProviderInfo_When_TheUserWillRegister_Then_ReturnError', () async {
      // Given
      InsertSmsProviderMapper provider = SmsFixtureValid.generateProvider();

      // When
      HttpResponse res = await service.save(info: provider);

      // Then
      expect(res, isA<HttpResponse>());
      expect(res.isSuccess, isFalse);
      expect(res.message, equals(SmsServiceMessages.error));
      expect(res.statusCode, equals(HttpStatus.serverError));
    });
  });
}
