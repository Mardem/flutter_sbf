import 'package:dio/dio.dart';
import 'package:flutter_sbf/core/di/components/remote/response.dart';

class HttpClientValid {
  HttpClientValid();

  static final Response<List<Map<String, dynamic>>> response = Response<List<Map<String, dynamic>>>(
    data: <Map<String, dynamic>>[
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
    ],
    statusCode: HttpStatus.success,
    requestOptions: RequestOptions(path: ''),
  );
}

class HttpClientPromotionsValid {
  HttpClientPromotionsValid();
  static final Response<List<Map<String, dynamic>>> response = Response<List<Map<String, dynamic>>>(
    data: <Map<String, dynamic>>[
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
    ],
    statusCode: HttpStatus.success,
    requestOptions: RequestOptions(path: ''),
  );
}

class HttpClientEstablishmentFiltersValid {
  HttpClientEstablishmentFiltersValid();

  static final Response<List<Map<String, dynamic>>> response = Response<List<Map<String, dynamic>>>(
    data: <Map<String, dynamic>>[
      <String, dynamic>{
        'id': 1,
        'name': 'Teste 1',
        'image': 'https://www.google.com/img.png',
      },
      <String, dynamic>{
        'id': 2,
        'name': 'Teste 2',
        'image': 'https://www.google.com/img.png',
      }
    ],
    statusCode: HttpStatus.success,
    requestOptions: RequestOptions(path: ''),
  );
}
