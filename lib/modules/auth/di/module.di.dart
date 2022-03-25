import 'package:flutter_sbf/core/di/inject.dart';
import 'package:flutter_sbf/modules/auth/src/data/local/account_local.service.dart';
import 'package:flutter_sbf/modules/auth/src/data/remote/services/account.service.dart';
import 'package:flutter_sbf/modules/auth/src/data/remote/services/google.service.dart';
import 'package:flutter_sbf/modules/auth/src/data/repository/account.repository.dart';
import 'package:flutter_sbf/modules/auth/src/domain/interactor/account.interactor.dart';
import 'package:flutter_sbf/modules/auth/src/domain/interactor/social.interactor.dart';
import 'package:flutter_sbf/modules/auth/src/domain/repository/account.repository.dart';
import 'package:flutter_sbf/modules/auth/src/domain/repository/social.repository.dart';
import 'package:flutter_sbf/modules/auth/src/presentation/login/login.viewmodel.dart';
import 'package:flutter_sbf/modules/auth/src/presentation/register/register.viewmodel.dart';

Future<void> startAuthModule() async {
  // Interactors
  inject.registerFactory<SocialLoginInteractor>(() => SocialLoginImpl());
  inject.registerFactory<AccountInteractor>(() => AccountInteractorImpl());

  // Repositories
  inject.registerFactory<SocialRepository>(() => SocialRepository());
  inject.registerFactory<AccountRepository>(() => AccountRepositoryImpl());

  // ViewModels
  inject.registerFactory<LoginViewModel>(() => LoginViewModel());
  inject.registerFactory<RegisterViewModel>(() => RegisterViewModel());

  // Services
  inject.registerFactory<GoogleAuthService>(() => GoogleAuthServiceImpl());
  inject.registerFactory<AccountService>(() => AccountServiceImpl());
  inject.registerFactory<AccountServiceLocal>(() => AccountServiceLocalImpl());
}
