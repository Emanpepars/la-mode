

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:la_mode/core/api/end_points.dart';
import 'package:la_mode/core/error/failure.dart';
import 'package:la_mode/features/auth/register/data/models/register_model.dart';
import 'package:la_mode/features/auth/register/domain/entities/user_data.dart';

import '../../../../../core/api/api_consumer.dart';
import '../../../../../core/error/server_failure.dart';
import '../../../../../core/utils/app_constants.dart';

abstract class RegisterDto {
  Future<Either<Failures, RegisterModel>> register(UserData userData);
}

class RemoteDto extends RegisterDto {
  Dio dio = Dio();
  ApiConsumer apiConsumer;

  RemoteDto({required this.apiConsumer});

  @override
  Future<Either<Failures, RegisterModel>> register(UserData userData) async {
    try {
      var response = await apiConsumer.post(
        '${AppConstants.baseUrl}${EndPoints.register}',
        data: {
          "name": userData.name,
          "email": userData.email,
          "password": userData.password,
          "rePassword": userData.confirmPassword,
          "phone": "01010700700"
        },
      );
      return Right(RegisterModel.fromJson(response));
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }
}
