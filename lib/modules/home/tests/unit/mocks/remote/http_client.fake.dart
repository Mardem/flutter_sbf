import 'package:dio/dio.dart';
import 'package:flutter_sbf/core/di/components/remote/http_client.dart';
import 'package:mockito/mockito.dart';

import '../../fixtures/remote/http_client.fixture.dart';

class MockHttpClientValidResponse extends Fake implements HttpClient {
  @override
  Future<Response<T>> get<T>(String url, {bool useToken = true}) async {
    return HttpClientValid.response as Response<T>;
  }
}

class MockHttpClientInvalidResponse extends Fake implements HttpClient {
  @override
  Future<Response<T>> get<T>(String url, {bool useToken = true}) async {
    throw DioError(
      requestOptions: RequestOptions(path: ''),
    );
  }
}

class MockHttpClientValidTypeResponse extends Fake implements HttpClient {
  @override
  Future<Response<T>> get<T>(String url, {bool useToken = true}) async {
    return HttpClientPromotionsValid.response as Response<T>;
  }
}

class MockHttpClientInvalidTypeResponse extends Fake implements HttpClient {
  @override
  Future<Response<T>> get<T>(String url, {bool useToken = true}) async {
    throw DioError(
      requestOptions: RequestOptions(path: ''),
    );
  }
}

class MockHttpClientValidFiltersResponse extends Fake implements HttpClient {
  @override
  Future<Response<T>> get<T>(String url, {bool useToken = true}) async {
    return HttpClientEstablishmentFiltersValid.response as Response<T>;
  }
}

class MockHttpClientInvalidFiltersResponse extends Fake implements HttpClient {
  @override
  Future<Response<T>> get<T>(String url, {bool useToken = true}) async {
    throw DioError(
      requestOptions: RequestOptions(path: ''),
    );
  }
}
