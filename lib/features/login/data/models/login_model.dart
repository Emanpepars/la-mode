import 'package:la_mode/features/login/domain/entities/login_entity.dart';
import 'package:la_mode/features/register/data/models/Register_Model.dart';

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
