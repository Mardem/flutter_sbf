import 'package:flutter_sbf/core/base/urls.dart';

class SmsUrls {
  static String saveProvider(String id) {
    return '${BaseUrls.host}/apps/$id/sms/settings';
  }
}
