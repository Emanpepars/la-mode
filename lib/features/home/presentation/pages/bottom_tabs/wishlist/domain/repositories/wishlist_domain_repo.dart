import 'package:dartz/dartz.dart';
import 'package:la_mode/core/error/failure.dart';
import 'package:la_mode/features/home/presentation/pages/bottom_tabs/wishlist/domain/entities/add_wish_entity.dart';
import 'package:la_mode/features/home/presentation/pages/bottom_tabs/wishlist/domain/entities/get_wishlist_entity.dart';

abstract class WishlistDomainRepo {
  Future<Either<Failures, GetWishlistEntity>> getWishlist();
  Future<Either<Failures, AddWishEntity>> addWish(String productId);
  Future<Either<Failures, AddWishEntity>> removeWish(String productId);

}
