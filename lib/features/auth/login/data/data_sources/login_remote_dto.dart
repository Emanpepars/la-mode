import 'package:dartz/dartz.dart';
import 'package:la_mode/core/api/api_consumer.dart';
import 'package:la_mode/core/api/end_points.dart';
import 'package:la_mode/core/error/failure.dart';
import 'package:la_mode/core/error/server_failure.dart';
import 'package:la_mode/core/utils/app_constants.dart';
import 'package:la_mode/features/auth/login/data/data_sources/login_data_sources.dart';
import 'package:la_mode/features/auth/login/data/models/login_model.dart';
import 'package:la_mode/features/auth/register/domain/entities/user_data.dart';

class LoginRemoteDto extends LoginDataSources {
  ApiConsumer api;

  LoginRemoteDto(this.api);

  @override
  Future<Either<Failures, LoginModel>> login(UserData userData) async {
    try {
      var response =
          await api.post('${AppConstants.baseUrl}${EndPoints.login}', data: {
        "email": userData.email,
        "password": userData.password,
      });
      return Right(LoginModel.fromJson(response));
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }
}
