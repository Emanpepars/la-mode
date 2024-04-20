import 'package:dartz/dartz.dart';
import 'package:la_mode/core/error/failure.dart';
import 'package:la_mode/features/home/presentation/pages/bottom_tabs/wishlist/domain/entities/get_wishlist_entity.dart';
import 'package:la_mode/features/home/presentation/pages/bottom_tabs/wishlist/domain/repositories/wishlist_domain_repo.dart';

import '../entities/add_wish_entity.dart';

class WishlistUseCase {
  WishlistDomainRepo wishlistDomainRepo;

  WishlistUseCase(this.wishlistDomainRepo);

  Future<Either<Failures, GetWishlistEntity>> getWishlist() =>
      wishlistDomainRepo.getWishlist();

  Future<Either<Failures, AddWishEntity>> addWish(String productId) =>
      wishlistDomainRepo.addWish(productId);

  Future<Either<Failures, AddWishEntity>> removeWish(String productId) =>
      wishlistDomainRepo.removeWish(productId);
}
