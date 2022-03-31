import 'package:dio/dio.dart';
import 'package:flutter_sbf/core/base/urls.dart';
import 'package:flutter_sbf/core/di/components/local/keys.dart';
import 'package:flutter_sbf/core/di/components/local/local_storage.dart';
import 'package:flutter_sbf/core/di/inject.dart';

abstract class HttpClient {
  Future<Response<dynamic>> auth(String login, String password);

  Future<Response<T>> get<T>(
    String url, {
    bool useToken = true,
  });

  Future<Response<T>> post<T>(
    String url, {
    dynamic body,
    bool useToken = true,
  });

  Future<Response<T>> put<T>(
    String url, {
    dynamic body,
    bool useToken = true,
  });

  Future<Response<T>> patch<T>(
    String url, {
    dynamic body,
    bool useToken = true,
  });

  Future<Response<T>> delete<T>(
    String url, {
    bool useToken = true,
  });
}

class DioImpl implements HttpClient {
  final LocalStorage localDataSource = inject<LocalStorage>();
  final Dio _client = Dio();

  Future<void> _interceptor({bool useToken = true}) async {
    final String? storageToken = await localDataSource.get(LocalAppKeys.token);

    final Map<String, dynamic> headers = <String, dynamic>{};

    headers['Content-Type'] = 'application/json';

    if (useToken == true && storageToken != null) {
      headers['Authorization'] = 'Basic $storageToken';
    }

    _client.options.headers = headers;
  }

  @override
  Future<Response<dynamic>> auth(String login, String password, {String? url}) async {
    await _interceptor(useToken: false);

    final Map<String, String> payload = <String, String>{
      'email': login,
      'senha': password,
    };

    return _client.post(url ?? BaseUrls.host, data: payload);
  }

  @override
  Future<Response<T>> get<T>(
    String url, {
    bool useToken = true,
  }) async {
    await _interceptor(useToken: useToken);
    return _client.get<T>(url);
  }

  @override
  Future<Response<T>> post<T>(
    String url, {
    dynamic body,
    bool useToken = true,
  }) async {
    await _interceptor(useToken: useToken);
    return _client.post<T>(url, data: body);
  }

  @override
  Future<Response<T>> put<T>(
    String url, {
    dynamic body,
    bool useToken = true,
  }) async {
    await _interceptor(useToken: useToken);
    return _client.put<T>(url, data: body);
  }

  @override
  Future<Response<T>> patch<T>(
    String url, {
    dynamic body,
    bool useToken = true,
  }) async {
    await _interceptor(useToken: useToken);
    return _client.put<T>(url, data: body);
  }

  @override
  Future<Response<T>> delete<T>(
    String url, {
    dynamic body,
    bool useToken = true,
  }) async {
    await _interceptor(useToken: useToken);
    return _client.delete<T>(url);
  }
}
