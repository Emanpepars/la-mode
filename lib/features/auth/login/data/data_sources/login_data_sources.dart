import 'package:dartz/dartz.dart';
import 'package:la_mode/core/error/failure.dart';
import 'package:la_mode/features/auth/login/data/models/login_model.dart';
import 'package:la_mode/features/auth/register/domain/entities/user_data.dart';


abstract class LoginDataSources {
  Future<Either<Failures, LoginModel>> login(UserData userData);
}
