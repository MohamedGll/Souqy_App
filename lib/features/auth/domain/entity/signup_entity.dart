class SignupEntity {
  String fullName;
  String phone;
  String email;
  String password;

  SignupEntity({
    required this.fullName,
    required this.phone,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": fullName,
      "email": email,
      "password": password,
      "rePassword": password,
      "phone": phone
    };
  }
}