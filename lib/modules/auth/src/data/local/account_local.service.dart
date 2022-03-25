import 'dart:convert';

import 'package:flutter_sbf/core/di/components/local/local_storage.dart';
import 'package:flutter_sbf/core/di/components/remote/response.dart';
import 'package:flutter_sbf/core/di/inject.dart';
import 'package:flutter_sbf/modules/auth/src/data/remote/mappers/login.mapper.dart';

abstract class AccountServiceLocal {
  HttpResponse keepConnected({required bool status});

  HttpResponse storeUserData({required Map<String, dynamic> userData});

  Future<HttpResponse<LoginMapper?>> getUserData();
}

class AccountServiceLocalImpl implements AccountServiceLocal {
  final _localStorage = inject<LocalStorage>();

  @override
  HttpResponse keepConnected({required bool status}) {
    HttpResponse response = HttpResponse();

    try {
      _localStorage.set(
        AccountServiceLocalKeys.keepConnected,
        status.toString(),
      );

      response
        ..isSuccess = true
        ..message = AccountServiceLocalMessage.success;
    } catch (e) {
      response
        ..isSuccess = false
        ..message = AccountServiceLocalMessage.error;
    }

    return response;
  }

  @override
  HttpResponse storeUserData({required Map<String, dynamic> userData}) {
    HttpResponse response = HttpResponse();

    try {
      _localStorage.set(
        AccountServiceLocalKeys.userData,
        jsonEncode(userData),
      );

      response
        ..isSuccess = true
        ..message = AccountServiceLocalMessage.success;
    } catch (e) {
      response
        ..isSuccess = false
        ..message = AccountServiceLocalMessage.error;
    }

    return response;
  }

  @override
  Future<HttpResponse<LoginMapper?>> getUserData() async {
    HttpResponse<LoginMapper> response = HttpResponse();

    try {
      String? encodedData = await _localStorage.get(
        AccountServiceLocalKeys.userData,
      );
      Map<String, dynamic> data = jsonDecode(encodedData!);

      LoginMapper mapper = LoginMapper.fromJson(data);

      response
        ..isSuccess = true
        ..data = mapper
        ..message = AccountServiceLocalMessage.successDecode
        ..statusCode = HttpStatus.success;
    } catch (e) {
      response
        ..isSuccess = false
        ..message = AccountServiceLocalMessage.errorDecode;
    }

    return response;
  }
}

class AccountServiceLocalKeys {
  static String keepConnected = 'keep_connected';
  static String userData = 'user_data';
}

class AccountServiceLocalMessage {
  static String success = 'Manter logado, ativado.';
  static String error = 'Não foi possível ativar essa função';

  static String errorDecode = 'Houve um problema ao recuperar os dados locais.';
  static String successDecode = 'Dados recuperados com sucesso!';
}
