import 'package:faker/faker.dart';
import 'package:flutter_sbf/modules/auth/src/data/remote/mappers/inser_register.mapper.dart';

class AccountServiceFixture {
  static String email = 'marden@gmail.com';
  static String password = '123456';

  static Map<String, dynamic> resultFake() {
    var faker = Faker();

    return {
      "token": faker.jwt.secret,
      "user": {
        "id": 12345678,
        "name": faker.person.name(),
        "email": faker.internet.safeEmail(),
      }
    };
  }

  static InsertRegisterMapper registerFake() {
    InsertRegisterMapper mapper = InsertRegisterMapper(
      name: faker.person.name(),
      email: faker.internet.safeEmail(),
      phoneNumber: faker.phoneNumber.us(),
      password: faker.jwt.secret,
      companyName: faker.company.name(),
      companyAddress: faker.address.streetName(),
    );

    return mapper;
  }
}
