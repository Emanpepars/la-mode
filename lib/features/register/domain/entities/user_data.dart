class UserData {
  final String? name;
  final String email;
  final String password;
  final String? confirmPassword;

  UserData({
    this.name,
    required this.email,
    required this.password,
    this.confirmPassword,
  });
}
