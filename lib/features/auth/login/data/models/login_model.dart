import 'package:la_mode/features/auth/login/domain/entities/login_entity.dart';
import 'package:la_mode/features/auth/register/data/models/register_model.dart';

class LoginModel extends LoginEntity {
  const LoginModel({
    this.message,
    required super.user,
    required super.token,
  });

  LoginModel.fromJson(dynamic json)
      : this(
          message: json['message'],
          user: UserModel.fromJson(json['user']),
          token: json['token'],
        );
  final String? message;
}
