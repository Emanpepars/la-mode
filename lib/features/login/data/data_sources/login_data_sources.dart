import 'package:dartz/dartz.dart';
import 'package:la_mode/features/login/data/models/login_model.dart';
import 'package:la_mode/features/register/domain/entities/user_data.dart';

import '../../../../core/error/failure.dart';

abstract class LoginDataSources {
  Future<Either<Failures, LoginModel>> login(UserData userData);
}
