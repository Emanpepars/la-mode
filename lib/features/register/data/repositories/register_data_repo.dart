import 'package:dartz/dartz.dart';
import 'package:la_mode/features/register/data/data_sources/register_data_source.dart';
import 'package:la_mode/features/register/domain/entities/user_data.dart';
import 'package:la_mode/features/register/domain/entities/user_entity.dart';
import 'package:la_mode/features/register/domain/repositories/register_domain_repo.dart';

import '../../../../core/error/failure.dart';

class RegisterDataRepo implements RegisterDomainRepo {
  RegisterDto registerDto;

  RegisterDataRepo({required this.registerDto});

  @override
  Future<Either<Failures, RegisterEntity>> register(UserData userData) => registerDto.register(userData);
}
