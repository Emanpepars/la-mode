import 'package:la_mode/core/error/failure.dart';
import 'package:la_mode/features/auth/register/domain/entities/user_entity.dart';

abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  RegisterEntity registerEntity;

  RegisterSuccess(this.registerEntity);
}

class RegisterError extends RegisterState {
  Failures failures;

  RegisterError({required this.failures});
}

class RegisterUpdateState extends RegisterState {}
