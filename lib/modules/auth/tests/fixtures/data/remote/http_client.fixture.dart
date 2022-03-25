import 'package:dio/dio.dart';
import 'package:flutter_sbf/core/di/components/remote/response.dart';

class HttpClientValid {
  static final response = Response(
    data: {"message": "Dado recebido com sucesso.", "status": true},
    statusCode: HttpStatus.success,
    requestOptions: RequestOptions(path: ''),
  );
}

class HttpClientInvalid {
  static final response = Response(
    data: {"message": "Não foi possível prosseguir.", "status": false},
    statusCode: HttpStatus.serverError,
    requestOptions: RequestOptions(path: ''),
  );
}
