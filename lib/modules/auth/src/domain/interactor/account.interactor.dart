import 'package:flutter_sbf/core/di/components/remote/response.dart';
import 'package:flutter_sbf/core/di/inject.dart';
import 'package:flutter_sbf/modules/auth/src/data/remote/mappers/inser_register.mapper.dart';
import 'package:flutter_sbf/modules/auth/src/data/remote/mappers/login.mapper.dart';
import 'package:flutter_sbf/modules/auth/src/domain/repository/account.repository.dart';

abstract class AccountInteractor {
  Future<HttpResponse<LoginMapper?>> login({
    required String email,
    required String password,
  });

  Future<HttpResponse> register({required InsertRegisterMapper user});
  HttpResponse keepConnected({required bool status});
  Future<HttpResponse<LoginMapper?>> getLocalUser();
}

class AccountInteractorImpl implements AccountInteractor {
  final _repository = inject<AccountRepository>();

  @override
  Future<HttpResponse<LoginMapper?>> login({
    required String email,
    required String password,
  }) {
    return _repository.login(email: email, password: password);
  }

  @override
  Future<HttpResponse> register({required InsertRegisterMapper user}) {
    return _repository.register(user: user);
  }

  @override
  HttpResponse keepConnected({required bool status}) {
    return _repository.keepConnected(status: status);
  }

  @override
  Future<HttpResponse<LoginMapper?>> getLocalUser() {
    return _repository.getLocalUser();
  }
}
