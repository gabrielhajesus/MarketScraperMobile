class User {
  final String fullName;
  final String email;
  final String password;
  final String? token;

  User(
      {required this.fullName,
      required this.email,
      required this.password,
      required this.token});

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'email': email,
      'password': password,
      'token': token,
    };
  }
}
