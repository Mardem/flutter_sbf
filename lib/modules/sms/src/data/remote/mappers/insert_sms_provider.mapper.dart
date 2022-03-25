class InsertSmsProviderMapper {
  InsertSmsProviderMapper({
    required this.settings,
  });

  Settings? settings;

  factory InsertSmsProviderMapper.fromJson(Map<String, dynamic> json) =>
      InsertSmsProviderMapper(
        settings: json["settings"] == null
            ? null
            : Settings.fromJson(json["settings"]),
      );

  Map<String, dynamic> toJson() => {
        "settings": settings == null ? null : settings!.toJson(),
      };
}

class Settings {
  Settings({
    required this.smsProvider,
  });

  SmsProvider? smsProvider;

  factory Settings.fromJson(Map<String, dynamic> json) => Settings(
        smsProvider: json["sms_provider"] == null
            ? null
            : SmsProvider.fromJson(json["sms_provider"]),
      );

  Map<String, dynamic> toJson() => {
        "sms_provider": smsProvider == null ? null : smsProvider!.toJson(),
      };
}

class SmsProvider {
  SmsProvider({
    required this.name,
    required this.login,
    required this.password,
  });

  String name;
  String login;
  String password;

  factory SmsProvider.fromJson(Map<String, dynamic> json) => SmsProvider(
        name: json["name"],
        login: json["login"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "login": login,
        "password": password,
      };
}
