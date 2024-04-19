import 'package:dartz/dartz.dart';
import 'package:la_mode/core/error/failure.dart';
import 'package:la_mode/features/home/presentation/pages/bottom_tabs/cart_tab/domain/entities/add_to_cart_entity.dart';
import 'package:la_mode/features/home/presentation/pages/bottom_tabs/cart_tab/domain/entities/cart_entity.dart';
import 'package:la_mode/features/home/presentation/pages/bottom_tabs/cart_tab/domain/repositories/cart_domain_repo.dart';

class CartUseCase {
  CartDomainRepo cartDomainRepo;

  CartUseCase(this.cartDomainRepo);

  Future<Either<Failures, CartEntity>> getCartItems() =>
      cartDomainRepo.getCartItems();

  Future<Either<Failures, AddToCartEntity>> addItemToCart(String productId) =>
      cartDomainRepo.addItemToCart(productId);

  Future<Either<Failures, CartEntity>> removeItemFromCart(String productId) =>
      cartDomainRepo.removeItemFromCart(productId);

  Future<Either<Failures, CartEntity>> updateItemCountCart(
          String productId, int count) =>
      cartDomainRepo.updateItemCountCart(productId, count);
}
