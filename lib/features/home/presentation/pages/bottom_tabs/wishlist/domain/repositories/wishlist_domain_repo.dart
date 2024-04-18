import 'package:dartz/dartz.dart';
import 'package:la_mode/core/error/failure.dart';
import 'package:la_mode/features/home/presentation/pages/bottom_tabs/wishlist/domain/entities/get_wishlist_entity.dart';

abstract class WishlistDomainRepo {
  Future<Either<Failures, GetWishlistEntity>> getWishlist();
}
