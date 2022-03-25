import 'dart:convert';

import 'package:mockito/mockito.dart';
import 'package:flutter_sbf/core/di/components/local/local_storage.dart';
import 'package:flutter_sbf/modules/auth/tests/fixtures/data/local/account_local.service.dart';

class MockLocalStorageAccountValid extends Fake implements LocalStorage {
  @override
  Future<String?> get(String key) async {
    return jsonEncode(AccountLocalServiceFixture.validJson);
  }

  @override
  void set(String key, dynamic value) {}
}
