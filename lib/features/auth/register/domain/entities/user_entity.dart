import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'user_entity.g.dart';

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

@HiveType(typeId: 0)
class UserEntity extends Equatable {
  const UserEntity({
    required this.name,
    required this.email,
  });

  @HiveField(0)
  final String name;
  @HiveField(1)
  final String email;

  @override
  List<Object?> get props => [name, email];
}
