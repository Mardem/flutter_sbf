import 'package:rxdart/rxdart.dart';
import 'package:flutter_sbf/core/base/viewmodel.base.dart';
import 'package:flutter_sbf/core/di/components/remote/response.dart';
import 'package:flutter_sbf/core/di/inject.dart';
import 'package:flutter_sbf/modules/sms/src/data/remote/mappers/insert_sms_provider.mapper.dart';
import 'package:flutter_sbf/modules/sms/src/domain/interactor/sms_configuration.interactor.dart';

class ConfigurationSmsViewModel extends BaseViewModel {
  final _interactor = inject<SmsConfigurationInteractor>();

  final _name = BehaviorSubject<String>.seeded('');

  Stream<String> get name => _name.stream;

  void setName(String value) => _name.add(value);

  final _login = BehaviorSubject<String>.seeded('');

  Stream<String> get login => _login.stream;

  void setLogin(String value) => _login.add(value);

  final _password = BehaviorSubject<String>.seeded('');

  Stream<String> get password => _password.stream;

  void setPassword(String value) => _password.add(value);

  save() async {
    setLoading(true);
    HttpResponse res = await _interactor.save(info: _generate());

    if (res.isSuccess) {
      setSuccess(res.message);
    } else {
      setError(res.message);
    }
    setLoading(false);
  }

  InsertSmsProviderMapper _generate() {
    SmsProvider provider = SmsProvider(
      password: _password.value,
      name: _name.value,
      login: _login.value,
    );

    Settings settings = Settings(smsProvider: provider);

    InsertSmsProviderMapper mapper = InsertSmsProviderMapper(
      settings: settings,
    );

    return mapper;
  }
}
