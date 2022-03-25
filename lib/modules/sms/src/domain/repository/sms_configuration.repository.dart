import 'package:flutter_sbf/core/di/components/remote/response.dart';
import 'package:flutter_sbf/modules/sms/src/data/remote/mappers/insert_sms_provider.mapper.dart';

abstract class SmsConfigurationRepository {
  Future<HttpResponse> save({required InsertSmsProviderMapper info});
}
