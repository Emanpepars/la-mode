import 'package:equatable/equatable.dart';
import 'package:la_mode/features/register/domain/entities/user_entity.dart';

class LoginEntity extends Equatable {
  const LoginEntity({
    required this.user,
    required this.token,
  });

  final UserEntity user;
  final String token;

  @override
  List<Object?> get props => [user, token];
}
