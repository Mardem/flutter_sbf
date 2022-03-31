import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_sbf/core/di/components/remote/http_client.dart';
import 'package:flutter_sbf/core/di/components/remote/response.dart';
import 'package:flutter_sbf/core/di/inject.dart';

import '../endpoints.dart';
import '../mappers/product.mapper.dart';

abstract class ProductService {
  Future<HttpResponse<List<ProductMapper>>> getPromotions();
}

class ProductServiceImpl implements ProductService {
  final HttpClient _client = inject<HttpClient>();

  @override
  Future<HttpResponse<List<ProductMapper>>> getPromotions() async {
    final HttpResponse<List<ProductMapper>> response = HttpResponse<List<ProductMapper>>();
    try {
      final Response<dynamic> req = await _client.get(HomeEndpoints.promotions);

      final List<ProductMapper> data = productMapperFromJson(req.data);

      response
        ..isSuccess = true
        ..data = data
        ..message = ProductServiceMessages.successPromotions
        ..statusCode = HttpStatus.success;
    } catch (e, stackTrace) {
      log(e.toString());
      log(stackTrace.toString());

      response
        ..isSuccess = false
        ..data = <ProductMapper>[]
        ..message = ProductServiceMessages.errorPromotions;
    }
    return response;
  }
}

class ProductServiceMessages {
  const ProductServiceMessages();

  static String successPromotions = 'Promoções carregadas com sucesso!';
  static String errorPromotions = 'Não foi possível carregar as promoções.';
}
