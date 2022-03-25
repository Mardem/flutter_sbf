import 'package:dio/dio.dart';
import 'package:flutter_sbf/core/di/components/remote/response.dart';
import 'package:flutter_sbf/modules/auth/tests/fixtures/data/remote/services/account.service.fixture.dart';

class HttpAccountClientValid {
  static final response = Response(
    data: AccountServiceFixture.resultFake(),
    statusCode: HttpStatus.success,
    requestOptions: RequestOptions(path: ''),
  );
}
