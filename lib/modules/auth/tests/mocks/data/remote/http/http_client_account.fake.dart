import 'package:dio/dio.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_sbf/core/di/components/remote/http_client.dart';
import 'package:flutter_sbf/modules/auth/tests/fixtures/data/remote/http/http_client_account.fixture.dart';

class MockHttpClientValidLoginResponse extends Fake implements HttpClient {
  @override
  Future<Response> post(
    String url, {
    dynamic body,
    bool useToken = true,
  }) async {
    return HttpAccountClientValid.response;
  }
}

class MockHttpClientInvalidLoginResponse extends Fake implements HttpClient {
  @override
  Future<Response> post(
    String url, {
    dynamic body,
    bool useToken = true,
  }) async {
    throw Exception('Houve um problema');
  }
}
