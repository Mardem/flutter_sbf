class FacebookSignInMapper {
  FacebookSignInMapper({
    this.name,
    this.email,
  });

  String? name;
  String? email;

  factory FacebookSignInMapper.fromJson(Map<String, dynamic> json) =>
      FacebookSignInMapper(
        name: json["name"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
      };
}
