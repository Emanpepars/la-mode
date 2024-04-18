import 'package:dartz/dartz.dart';
import 'package:la_mode/core/error/failure.dart';
import 'package:la_mode/features/home/presentation/pages/bottom_tabs/cart_tab/domain/entities/add_to_cart_entity.dart';
import 'package:la_mode/features/home/presentation/pages/bottom_tabs/cart_tab/domain/entities/cart_entity.dart';

abstract class CartDomainRepo {
  Future<Either<Failures, CartEntity>> getCartItems();

  Future<Either<Failures, AddToCartEntity>> addItemToCart(String productId);

  Future<Either<Failures, CartEntity>> removeItemFromCart(String productId);
}
