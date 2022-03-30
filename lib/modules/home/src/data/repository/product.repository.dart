import 'package:flutter_sbf/core/di/components/remote/response.dart';
import 'package:flutter_sbf/core/di/inject.dart';
import 'package:flutter_sbf/core/utils/connection.util.dart';
import 'package:flutter_sbf/modules/home/src/data/remote/mappers/product.mapper.dart';
import 'package:flutter_sbf/modules/home/src/data/remote/services/product.service.dart';

abstract class ProductRepository {
  Future<HttpResponse<List<ProductMapper>>> getPromotions();
}

class ProductRepositoryImpl implements ProductRepository {
  final ConnectionUtil _connection = inject<ConnectionUtil>();
  final ProductService _service = inject<ProductService>();

  @override
  Future<HttpResponse<List<ProductMapper>>> getPromotions() async {
    final bool hasConnection = await _connection.hasConnection();
    final HttpResponse<List<ProductMapper>> response = HttpResponse<List<ProductMapper>>();

    if (hasConnection) {
      return _service.getPromotions();
    } else {
      response
        ..isSuccess = false
        ..data = <ProductMapper>[]
        ..message = 'Aparelho offline';
    }

    return response;
  }
}
