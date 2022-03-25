import 'dart:convert';

LoginMapper loginMapperFromJson(String str) =>
    LoginMapper.fromJson(json.decode(str));

class LoginMapper {
  LoginMapper({
    required this.token,
    required this.user,
  });

  String token;
  User? user;

  factory LoginMapper.fromJson(Map<String, dynamic> json) => LoginMapper(
        token: json["token"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "user": user == null ? null : user!.toJson(),
      };
}

class User {
  User({
    required this.id,
    required this.name,
    required this.email,
  });

  int id;
  String name;
  String email;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
      };
}
