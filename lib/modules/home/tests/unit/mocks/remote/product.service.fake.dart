import 'package:flutter_sbf/core/di/components/remote/response.dart';
import 'package:flutter_sbf/modules/home/src/data/remote/mappers/product.mapper.dart';
import 'package:flutter_sbf/modules/home/src/data/remote/services/product.service.dart';
import 'package:flutter_sbf/modules/home/tests/unit/fixtures/remote/product.service.fixture.dart';
import 'package:mockito/mockito.dart';

class MockProductService extends Fake implements ProductService {
  @override
  Future<HttpResponse<List<ProductMapper>>> getPromotions() async {
    return ProductServiceFixture.promotions();
  }
}
