import 'package:dartz/dartz.dart';
import 'package:la_mode/core/error/failure.dart';
import 'package:la_mode/features/home/presentation/pages/bottom_tabs/cart_tab/data/data_sources/cart_dto.dart';
import 'package:la_mode/features/home/presentation/pages/bottom_tabs/cart_tab/domain/entities/cart_entity.dart';
import 'package:la_mode/features/home/presentation/pages/bottom_tabs/cart_tab/domain/repositories/cart_domain_repo.dart';

class CartDataRepo implements CartDomainRepo {
  CartDto cartDto;

  CartDataRepo(this.cartDto);

  @override
  Future<Either<Failures, CartEntity>> getCartItems() => cartDto.getCartItems();
}
