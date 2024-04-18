import 'package:la_mode/core/error/failure.dart';

import '../../domain/entities/cart_entity.dart';

abstract class CartState {}

class CartInitialState extends CartState {}

class CartLoadingState extends CartState {}

class CartSuccessState extends CartState {}

class CartErrorState extends CartState {}

class GetCartItemLoadingState extends CartState {}

class GetCartItemSuccessState extends CartState {
  CartDataEntity cartDataEntity;

  GetCartItemSuccessState(this.cartDataEntity);
}

class GetCartItemErrorState extends CartState {
  Failures failures;

  GetCartItemErrorState(this.failures);
}
