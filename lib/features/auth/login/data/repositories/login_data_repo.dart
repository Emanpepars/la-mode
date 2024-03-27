import 'package:dartz/dartz.dart';
import 'package:la_mode/core/error/failure.dart';
import 'package:la_mode/features/auth/login/domain/entities/login_entity.dart';
import 'package:la_mode/features/auth/login/domain/repositories/login_domain_repo.dart';
import 'package:la_mode/features/auth/register/domain/entities/user_data.dart';

import '../data_sources/login_data_sources.dart';

class LoginDataRepo implements LoginDomainRepo {
  LoginDataSources loginDataSources;

  LoginDataRepo(this.loginDataSources);

  @override
  Future<Either<Failures, LoginEntity>> login(UserData userData) =>
      loginDataSources.login(userData);
}
