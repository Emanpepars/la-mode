import 'package:dartz/dartz.dart';
import 'package:la_mode/core/error/failure.dart';
import 'package:la_mode/features/home/presentation/pages/bottom_tabs/wishlist/data/data_sources/wishlist_dto.dart';
import 'package:la_mode/features/home/presentation/pages/bottom_tabs/wishlist/domain/entities/get_wishlist_entity.dart';
import 'package:la_mode/features/home/presentation/pages/bottom_tabs/wishlist/domain/repositories/wishlist_domain_repo.dart';

import '../../domain/entities/add_wish_entity.dart';

class WishlistDataRepo implements WishlistDomainRepo {
  WishlistDto wishlistDto;

  WishlistDataRepo(this.wishlistDto);

  @override
  Future<Either<Failures, GetWishlistEntity>> getWishlist() =>
      wishlistDto.getWishlist();

  @override
  Future<Either<Failures, AddWishEntity>> addWish(String productId) =>
      wishlistDto.addWish(productId);
}
