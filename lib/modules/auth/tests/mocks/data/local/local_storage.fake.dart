import 'package:mockito/mockito.dart';
import 'package:flutter_sbf/core/di/components/local/local_storage.dart';

class MockLocalStorageValid extends Fake implements LocalStorage {
  @override
  Future<String?> get(String key) async {
    return 'disabled';
  }

  @override
  void set(String key, dynamic value) {}
}

class MockLocalStorageInvalid extends Fake implements LocalStorage {
  @override
  Future<String?> get(String key) async {
    return '';
  }

  @override
  void set(String key, dynamic value) {}
}

class MockLocalStorageEmpty extends Fake implements LocalStorage {
  @override
  Future<String?> get(String key) async {
    return null;
  }

  @override
  void set(String key, dynamic value) {}
}

class MockLocalStorageError extends Fake implements LocalStorage {
  @override
  Future<String?> get(String key) async {
    throw UnimplementedError('Houve um erro ao tentar recuperar os dados.');
  }

  @override
  void set(String key, dynamic value) {
    throw UnimplementedError('Houve um erro ao tentar recuperar os dados.');
  }
}
