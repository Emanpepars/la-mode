import 'package:dartz/dartz.dart';
import 'package:la_mode/core/api/api_consumer.dart';
import 'package:la_mode/core/api/end_points.dart';
import 'package:la_mode/core/error/failure.dart';
import 'package:la_mode/core/error/server_failure.dart';
import 'package:la_mode/core/utils/app_constants.dart';
import 'package:la_mode/features/home/presentation/pages/bottom_tabs/wishlist/data/models/add_wish_model.dart';
import 'package:la_mode/features/home/presentation/pages/bottom_tabs/wishlist/data/models/get_wishlist_model.dart';

abstract class WishlistDto {
  Future<Either<Failures, GetWishlistModel>> getWishlist();

  Future<Either<Failures, AddWishModel>> addWish(String productId);
}

class RemoteWishlistDto extends WishlistDto {
  ApiConsumer api;

  RemoteWishlistDto(this.api);

  @override
  Future<Either<Failures, GetWishlistModel>> getWishlist() async {
    try {
      var response =
          await api.get("${AppConstants.baseUrl}${EndPoints.wishlist}");

      GetWishlistModel getWishlistModel = GetWishlistModel.fromJson(response);
      return Right(getWishlistModel);
    } catch (e) {
      print(e.toString());
      return Left(ServerFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, AddWishModel>> addWish(String productId) async {
    try {
      var response = await api.post(
        "${AppConstants.baseUrl}${EndPoints.wishlist}",
        data: {
          {
            "productId": productId,
          }
        },
      );

      AddWishModel addWishModel = AddWishModel.fromJson(response);
      return Right(addWishModel);
    } catch (e) {
      print(e.toString());
      return Left(ServerFailures(e.toString()));
    }
  }
}
