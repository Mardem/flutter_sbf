import 'package:flutter_sbf/core/di/inject.dart';
import 'package:flutter_sbf/modules/sms/src/data/remote/services/sms.service.dart';
import 'package:flutter_sbf/modules/sms/src/data/remote/sms_configuration.repository.dart';
import 'package:flutter_sbf/modules/sms/src/domain/interactor/sms_configuration.interactor.dart';
import 'package:flutter_sbf/modules/sms/src/domain/repository/sms_configuration.repository.dart';
import 'package:flutter_sbf/modules/sms/src/presentation/configuration/configuration.viewmodel.dart';

Future<void> startSmsModule() async {
  // Interactors
  inject.registerFactory<SmsConfigurationInteractor>(
    () => SmsConfigurationInteractorImpl(),
  );

  // Repositories
  inject.registerFactory<SmsConfigurationRepository>(
    () => SmsConfigurationRepositoryImpl(),
  );

  // ViewModels
  inject.registerFactory<ConfigurationSmsViewModel>(() => ConfigurationSmsViewModel());

  // Services
  inject.registerFactory<SmsService>(() => SmsServiceImpl());
}
