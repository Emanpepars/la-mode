import 'package:dartz/dartz.dart';
import 'package:la_mode/core/api/api_consumer.dart';
import 'package:la_mode/core/api/end_points.dart';
import 'package:la_mode/core/error/failure.dart';
import 'package:la_mode/core/error/server_failure.dart';
import 'package:la_mode/core/utils/app_constants.dart';

import '../models/cart_model.dart';

abstract class CartDto {
  Future<Either<Failures, CartModel>> getCartItems();
}

class RemoteCartDto extends CartDto {
  ApiConsumer apiConsumer;

  RemoteCartDto(this.apiConsumer);

  @override
  Future<Either<Failures, CartModel>> getCartItems() async {
    try {
      var response =
          await apiConsumer.get('${AppConstants.baseUrl}${EndPoints.cart}');

      CartModel cartModel = CartModel.fromJson(response);
      return Right(cartModel);
    } catch (e) {
      return Left(
        ServerFailures(e.toString()),
      );
    }
  }
}
