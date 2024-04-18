import 'package:dartz/dartz.dart';
import 'package:la_mode/core/api/api_consumer.dart';
import 'package:la_mode/core/api/end_points.dart';
import 'package:la_mode/core/error/failure.dart';
import 'package:la_mode/core/error/server_failure.dart';
import 'package:la_mode/core/utils/app_constants.dart';
import 'package:la_mode/features/home/data/models/product_model.dart';

abstract class HomeDto {
  Future<Either<Failures, ProductModel>> getAllProduct();
}

class RemoteHomeDto extends HomeDto {
  ApiConsumer api;

  RemoteHomeDto(this.api);

  @override
  Future<Either<Failures, ProductModel>> getAllProduct() async {
    try {
      var response =
          await api.get("${AppConstants.baseUrl}${EndPoints.getAllProducts}");
      ProductModel productModel = ProductModel.fromJson(response);
      return Right(productModel);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }
}
