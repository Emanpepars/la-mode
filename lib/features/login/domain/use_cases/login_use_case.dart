import 'package:dartz/dartz.dart';
import 'package:la_mode/core/error/failure.dart';
import 'package:la_mode/features/login/domain/entities/login_entity.dart';

import '../../../register/domain/entities/user_data.dart';
import '../repositories/login_domain_repo.dart';

class LoginUseCase {
  LoginDomainRepo loginDomainRepo;

  LoginUseCase(this.loginDomainRepo);

  Future<Either<Failures, LoginEntity>> login(UserData userData) =>
      loginDomainRepo.login(userData);
}
