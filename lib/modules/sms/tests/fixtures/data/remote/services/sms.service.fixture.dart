import 'package:faker/faker.dart';
import 'package:flutter_sbf/modules/sms/src/data/remote/mappers/insert_sms_provider.mapper.dart';

class SmsFixtureValid {
  static InsertSmsProviderMapper generateProvider() {
    var faker = Faker();

    SmsProvider provider = SmsProvider(
      password: faker.jwt.secret,
      name: faker.company.name(),
      login: faker.internet.httpUrl(),
    );

    Settings settings = Settings(smsProvider: provider);

    InsertSmsProviderMapper mapper = InsertSmsProviderMapper(
      settings: settings,
    );

    return mapper;
  }
}
