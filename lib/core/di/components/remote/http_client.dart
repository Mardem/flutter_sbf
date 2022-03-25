import 'package:dio/dio.dart';

abstract class HttpClient {
  Future<Response> get(String url, {bool useToken = true});
  Future<Response> post(String url, {dynamic body, bool useToken = true});
  Future<Response> put(String url, {dynamic body, bool useToken = true});
  Future<Response> patch(String url, {dynamic body, bool useToken = true});
  Future<Response> delete(String url, {bool useToken = true});
}

class DioImpl implements HttpClient {
  final _client = Dio();

  Future<void> _interceptor({bool useToken = true}) async {
    Map<String, dynamic> headers = {};

    headers['Content-Type'] = 'application/json';

    if (useToken == true) {
      headers['Authorization'] = "Basic TOKEN";
    }

    _client.options.headers = headers;
  }

  @override
  Future<Response> get(String url, {bool useToken = true}) async {
    await _interceptor(useToken: useToken);
    return _client.get(url);
  }

  @override
  Future<Response> post(String url,
      {dynamic body, bool useToken = true}) async {
    await _interceptor(useToken: useToken);
    return _client.post(url, data: body);
  }

  @override
  Future<Response> put(String url, {dynamic body, bool useToken = true}) async {
    await _interceptor(useToken: useToken);
    return _client.put(url, data: body);
  }

  @override
  Future<Response> patch(String url,
      {dynamic body, bool useToken = true}) async {
    await _interceptor(useToken: useToken);
    return _client.put(url, data: body);
  }

  @override
  Future<Response> delete(String url,
      {dynamic body, bool useToken = true}) async {
    await _interceptor(useToken: useToken);
    return _client.delete(url);
  }
}
