import 'package:flutter_sbf/core/di/components/remote/response.dart';
import 'package:flutter_sbf/modules/home/src/data/remote/mappers/product.mapper.dart';
import 'package:flutter_sbf/modules/home/src/data/remote/services/product.service.dart';

class ProductServiceFixture {
  const ProductServiceFixture();

  static HttpResponse<List<ProductMapper>> promotions() {
    final HttpResponse<List<ProductMapper>> response = HttpResponse<List<ProductMapper>>();

    response
      ..isSuccess = true
      ..data = productMapperFromJson(<Map<String, dynamic>>[
        <String, dynamic>{
          'name': 'Tênis Asics Gel-Dedicate 6 - Masculino',
          'image':
              'https://imgcentauro-a.akamaihd.net/250x250/9469584WA1/tenis-asics-gel-dedicate-6-masculino-img.jpg',
          'price': 566.83,
          'oldPrice': 687.76,
          'rate': 1,
          'reviews': 1053,
          'freeShipping': true,
          'discount': 82,
          'id': '34f7d111-f042-4a53-8dbb-9c64495a518e',
          'colors': 9
        }
      ])
      ..message = ProductServiceMessages.successPromotions
      ..statusCode = HttpStatus.success;
    return response;
  }
}
