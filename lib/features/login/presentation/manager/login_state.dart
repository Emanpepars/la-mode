import 'package:la_mode/core/error/failure.dart';
import 'package:la_mode/features/login/domain/entities/login_entity.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  LoginEntity loginEntity;

  LoginSuccess(this.loginEntity);
}

class LoginError extends LoginState {
  Failures failures;

  LoginError(this.failures);
}
