import 'package:la_mode/features/register/domain/entities/user_entity.dart';

class RegisterModel extends RegisterEntity {
  const RegisterModel({
    this.message,
    required super.user,
    required super.token,
  });

  RegisterModel.fromJson(dynamic json)
      : this(
          message: json['message'],
          user: UserModel.fromJson(json['user']),
          token: json['token'],
        );

  final String? message;
}

class UserModel extends UserEntity {
  const UserModel({
    required super.name,
    required super.email,
    this.role,
  });

  UserModel.fromJson(dynamic json)
      : this(
          name: json['name'],
          email: json['email'],
          role: json['role'],
        );
  final String? role;
}
