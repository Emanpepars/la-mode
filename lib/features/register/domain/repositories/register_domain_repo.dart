import 'package:dartz/dartz.dart';
import 'package:la_mode/features/register/domain/entities/user_data.dart';

import '../../../../core/error/failure.dart';
import '../entities/user_entity.dart';

abstract class RegisterDomainRepo {
  Future<Either<Failures, RegisterEntity>> register(UserData userData);
}
