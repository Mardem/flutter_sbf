import 'package:flutter_sbf/core/di/components/remote/response.dart';
import 'package:flutter_sbf/core/di/inject.dart';
import 'package:flutter_sbf/modules/auth/src/data/local/account_local.service.dart';
import 'package:flutter_sbf/modules/auth/src/data/remote/mappers/inser_register.mapper.dart';
import 'package:flutter_sbf/modules/auth/src/data/remote/mappers/login.mapper.dart';
import 'package:flutter_sbf/modules/auth/src/data/remote/services/account.service.dart';
import 'package:flutter_sbf/modules/auth/src/domain/repository/account.repository.dart';

class AccountRepositoryImpl implements AccountRepository {
  final _accountService = inject<AccountService>();
  final _accountServiceLocal = inject<AccountServiceLocal>();

  @override
  Future<HttpResponse<LoginMapper?>> login({
    required String email,
    required String password,
  }) {
    return _accountService.login(email: email, password: password);
  }

  @override
  Future<HttpResponse> register({required InsertRegisterMapper user}) {
    return _accountService.register(user: user);
  }

  @override
  HttpResponse keepConnected({required bool status}) {
    return _accountServiceLocal.keepConnected(status: status);
  }

  @override
  Future<HttpResponse<LoginMapper?>> getLocalUser() {
    return _accountServiceLocal.getUserData();
  }
}
