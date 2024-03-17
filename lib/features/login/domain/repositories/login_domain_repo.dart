import 'package:dartz/dartz.dart';
import 'package:la_mode/core/error/failure.dart';
import 'package:la_mode/features/login/domain/entities/login_entity.dart';
import 'package:la_mode/features/register/domain/entities/user_data.dart';

abstract class LoginDomainRepo {
  Future<Either<Failures, LoginEntity>> login(UserData userData);
}
