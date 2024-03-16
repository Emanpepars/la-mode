import 'package:equatable/equatable.dart';

class RegisterEntity extends Equatable {
  const RegisterEntity({
    required this.user,
    required this.token,
  });

  final UserEntity user;
  final String token;

  @override
  List<Object?> get props => [user, token];
}

class UserEntity extends Equatable {
  const UserEntity({
    required this.name,
    required this.email,
  });

  final String name;
  final String email;

  @override
  List<Object?> get props => [name, email];
}
