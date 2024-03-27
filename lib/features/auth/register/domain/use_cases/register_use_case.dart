import 'package:dartz/dartz.dart';
import 'package:la_mode/core/error/failure.dart';
import 'package:la_mode/features/auth/register/domain/repositories/register_domain_repo.dart';

import '../entities/user_data.dart';
import '../entities/user_entity.dart';

class RegisterUseCase {
  RegisterDomainRepo registerDomainRepo;

  RegisterUseCase({required this.registerDomainRepo});

  Future<Either<Failures, RegisterEntity>> call(UserData userData) =>
      registerDomainRepo.register(userData);
}
