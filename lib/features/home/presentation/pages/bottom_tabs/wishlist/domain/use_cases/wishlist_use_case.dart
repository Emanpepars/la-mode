import 'package:dartz/dartz.dart';
import 'package:la_mode/core/error/failure.dart';
import 'package:la_mode/features/home/presentation/pages/bottom_tabs/wishlist/domain/entities/get_wishlist_entity.dart';
import 'package:la_mode/features/home/presentation/pages/bottom_tabs/wishlist/domain/repositories/wishlist_domain_repo.dart';

class WishlistUseCase {
  WishlistDomainRepo wishlistDomainRepo;

  WishlistUseCase(this.wishlistDomainRepo);

  Future<Either<Failures, GetWishlistEntity>> getWishlist() =>
      wishlistDomainRepo.getWishlist();
}
