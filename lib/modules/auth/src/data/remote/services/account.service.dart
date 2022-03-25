import 'package:dio/dio.dart';
import 'package:flutter_sbf/core/di/components/remote/http_client.dart';
import 'package:flutter_sbf/core/di/components/remote/response.dart';
import 'package:flutter_sbf/core/di/inject.dart';
import 'package:flutter_sbf/modules/auth/src/data/local/account_local.service.dart';
import 'package:flutter_sbf/modules/auth/src/data/remote/mappers/inser_register.mapper.dart';
import 'package:flutter_sbf/modules/auth/src/data/remote/mappers/login.mapper.dart';
import 'package:flutter_sbf/modules/auth/src/data/urls/urls.dart';

abstract class AccountService {
  Future<HttpResponse<LoginMapper?>> login({required email, required password});
  Future<HttpResponse> register({required InsertRegisterMapper user});
}

class AccountServiceImpl implements AccountService {
  final _client = inject<HttpClient>();
  final _localService = inject<AccountServiceLocal>();

  @override
  Future<HttpResponse<LoginMapper?>> login({
    required email,
    required password,
  }) async {
    HttpResponse<LoginMapper> response = HttpResponse();
    try {
      Response res = await _client.post(AccountUrls.login, body: {
        'login': email,
        'password': password,
      });

      LoginMapper mapper = LoginMapper.fromJson(res.data);

      _localService.storeUserData(userData: res.data);

      response
        ..isSuccess = true
        ..data = mapper
        ..message = AccountServiceMessages.success
        ..statusCode = HttpStatus.success;
    } catch (e) {
      response
        ..isSuccess = false
        ..message = AccountServiceMessages.error;
    }
    return response;
  }

  @override
  Future<HttpResponse> register({required InsertRegisterMapper user}) async {
    HttpResponse<LoginMapper> response = HttpResponse();
    try {
      Response res = await _client.post(AccountUrls.login, body: user.toJson());

      LoginMapper mapper = LoginMapper.fromJson(res.data);

      response
        ..isSuccess = true
        ..data = mapper
        ..message = AccountServiceMessages.successRegister
        ..statusCode = HttpStatus.success;
    } catch (e) {
      response
        ..isSuccess = false
        ..message = AccountServiceMessages.errorRegister;
    }
    return response;
  }
}

class AccountServiceMessages {
  static String error = 'Houve um problema ao realizar o login!';
  static String success = 'Autenticado com sucesso!';

  static String successRegister = 'Conta criada com sucesso!';
  static String errorRegister = 'Houve um problema ao criar sua conta!';
}
