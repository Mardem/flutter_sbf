import 'package:flutter_sbf/core/di/components/remote/response.dart';
import 'package:flutter_sbf/core/di/inject.dart';
import 'package:flutter_sbf/core/utils/connection.util.dart';
import 'package:flutter_sbf/modules/home/src/data/remote/mappers/product.mapper.dart';
import 'package:flutter_sbf/modules/home/src/data/remote/services/product.service.dart';
import 'package:flutter_sbf/modules/home/src/data/repository/product.repository.dart';
import 'package:flutter_sbf/modules/home/tests/unit/mocks/device/connection.util.fake.dart';
import 'package:flutter_sbf/modules/home/tests/unit/mocks/remote/product.service.fake.dart';
import 'package:test/test.dart';

void main() {
  /// ----------------------------------------
  ///  All below tests are successfully tests
  /// ----------------------------------------

  group('Testing Product Repository on Promotion Request With Connection On', () {
    late ProductRepository repository;

    setUpAll(() {
      inject.registerFactory<ProductService>(() => MockProductService());
      inject.registerFactory<ConnectionUtil>(() => MockConnectionUtilWithConnection());

      repository = ProductRepositoryImpl();
    });

    tearDownAll(() {
      inject.unregister<ProductService>();
      inject.unregister<ConnectionUtil>();
    });

    test('Given_TheProductRepository_When_CallForGetPromotions_Then_WillReturnPromosWithSuccess',
        () async {
      // Given
      final String message = ProductServiceMessages.successPromotions;

      // When
      final HttpResponse<List<ProductMapper>> res = await repository.getPromotions();

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
    late ProductRepository repository;

    setUpAll(() {
      inject.registerFactory<ProductService>(() => MockProductService());
      inject.registerFactory<ConnectionUtil>(() => MockConnectionUtilWithoutConnection());

      repository = ProductRepositoryImpl();
    });

    tearDownAll(() {
      inject.unregister<ProductService>();
      inject.unregister<ConnectionUtil>();
    });

    test('Given_TheProductService_When_CallForGetPromotions_Then_WillReturnPromosWithSuccess',
        () async {
      // Given
      const String message = 'Aparelho offline';

      // When
      final HttpResponse<List<ProductMapper>> res = await repository.getPromotions();

      // Then
      expect(res, isA<HttpResponse<List<ProductMapper>>>());
      expect(res.data, isA<List<ProductMapper>>());
      expect(res.isSuccess, isFalse);
      expect(res.message, equals(message));
      expect(res.statusCode, equals(HttpStatus.serverError));
    });
  });
}
