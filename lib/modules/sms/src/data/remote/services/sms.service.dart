import 'package:flutter_sbf/core/di/components/remote/http_client.dart';
import 'package:flutter_sbf/core/di/components/remote/response.dart';
import 'package:flutter_sbf/core/di/inject.dart';
import 'package:flutter_sbf/modules/sms/src/data/remote/mappers/insert_sms_provider.mapper.dart';
import 'package:flutter_sbf/modules/sms/src/data/urls/urls.dart';

abstract class SmsService {
  Future<HttpResponse> save({required InsertSmsProviderMapper info});
}

class SmsServiceImpl implements SmsService {
  final _client = inject<HttpClient>();

  @override
  Future<HttpResponse> save({required InsertSmsProviderMapper info}) async {
    HttpResponse response = HttpResponse();
    try {
      await _client.post(
        SmsUrls.saveProvider('123456'),
        body: info.toJson(),
        useToken: true,
      );

      response
        ..isSuccess = true
        ..data = []
        ..message = SmsServiceMessages.success
        ..statusCode = HttpStatus.success;
    } catch (e) {
      response
        ..isSuccess = false
        ..message = SmsServiceMessages.error;
    }
    return response;
  }
}

class SmsServiceMessages {
  static String success = 'Provedor SMS registrado!';
  static String error = 'Houve um problema o salvar o provedor!';
}
