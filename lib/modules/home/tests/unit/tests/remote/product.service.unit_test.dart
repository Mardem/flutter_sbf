import 'package:flutter_sbf/core/di/components/remote/http_client.dart';
import 'package:flutter_sbf/core/di/components/remote/response.dart';
import 'package:flutter_sbf/core/di/inject.dart';
import 'package:flutter_sbf/modules/home/src/data/remote/mappers/product.mapper.dart';
import 'package:flutter_sbf/modules/home/src/data/remote/services/product.service.dart';
import 'package:flutter_sbf/modules/home/tests/unit/mocks/remote/http_client.fake.dart';
import 'package:test/test.dart';

void main() {
  /// ----------------------------------------
  ///  All below tests are successfully tests
  /// ----------------------------------------

  group('Testing Product Service on Promotion Request With Success', () {
    late ProductService service;

    setUpAll(() {
      inject.registerFactory<HttpClient>(() => MockHttpClientValidTypeResponse());

      service = ProductServiceImpl();
    });

    tearDownAll(() {
      inject.unregister<HttpClient>();
    });

    test('Given_TheProductService_When_CallForGetPromotions_Then_WillReturnPromosWithSuccess',
        () async {
      // Given
      final String message = ProductServiceMessages.successPromotions;

      // When
      final HttpResponse<List<ProductMapper>> res = await service.getPromotions();

      // Then
      expect(res, isA<HttpResponse<List<ProductMapper>>>());
      expect(res.data, isA<List<ProductMapper>>());
      expect(res.isSuccess, isTrue);
      expect(res.message, equals(message));
      expect(res.statusCode, equals(HttpStatus.success));
    });
  });

  /// ----------------------------------------
  ///    All below tests are error tests
  /// ----------------------------------------
  group('Testing Product Service on Promotion Request With Success', () {
    late ProductService service;

    setUpAll(() {
      inject.registerFactory<HttpClient>(() => MockHttpClientInvalidTypeResponse());

      service = ProductServiceImpl();
    });

    tearDownAll(() {
      inject.unregister<HttpClient>();
    });

    test('Given_TheProductService_When_CallForGetPromotions_Then_WillReturnPromosWithSuccess',
        () async {
      // Given
      final String message = ProductServiceMessages.errorPromotions;

      // When
      final HttpResponse<List<ProductMapper>> res = await service.getPromotions();

      // Then
      expect(res, isA<HttpResponse<List<ProductMapper>>>());
      expect(res.data, isA<List<ProductMapper>>());
      expect(res.isSuccess, isFalse);
      expect(res.message, equals(message));
      expect(res.statusCode, equals(HttpStatus.serverError));
    });
  });
}
