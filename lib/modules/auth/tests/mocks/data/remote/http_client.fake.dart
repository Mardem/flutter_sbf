import 'package:dio/dio.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_sbf/core/di/components/remote/http_client.dart';
import 'package:flutter_sbf/modules/auth/tests/fixtures/data/remote/http_client.fixture.dart';

class MockHttpClientValidResponse extends Fake implements HttpClient {
  @override
  Future<Response> get(String url, {bool useToken = true}) async {
    return HttpClientValid.response;
  }

  @override
  Future<Response> post(
    String url, {
    dynamic body,
    bool useToken = true,
  }) async {
    return HttpClientValid.response;
  }
}

class MockHttpClientInvalidResponse extends Fake implements HttpClient {
  @override
  Future<Response> get(String url, {bool useToken = true}) async {
    throw DioError(
      requestOptions: RequestOptions(path: ''),
    );
  }

  @override
  Future<Response> post(
    String url, {
    dynamic body,
    bool useToken = true,
  }) async {
    throw DioError(
      requestOptions: RequestOptions(path: ''),
    );
  }
}
