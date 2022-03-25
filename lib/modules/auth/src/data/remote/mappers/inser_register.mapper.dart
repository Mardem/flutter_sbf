class InsertRegisterMapper {
  InsertRegisterMapper({
    required this.email,
    required this.name,
    required this.companyName,
    required this.phoneNumber,
    required this.companyAddress,
    required this.password,
  });

  String email;
  String name;
  String companyName;
  String phoneNumber;
  String companyAddress;
  String password;

  factory InsertRegisterMapper.fromJson(Map<String, dynamic> json) =>
      InsertRegisterMapper(
        email: json["email"],
        name: json["name"],
        companyName: json["company_name"],
        phoneNumber: json["phone_number"],
        companyAddress: json["company_address"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "name": name,
        "company_name": companyName,
        "phone_number": phoneNumber,
        "company_address": companyAddress,
        "password": password,
      };
}
