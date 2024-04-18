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

class AddCartItemLoadingState extends CartState {}

class AddCartItemSuccessState extends CartState {}

class AddCartItemErrorState extends CartState {
  Failures failures;

  AddCartItemErrorState(this.failures);
}

class RemoveCartItemLoadingState extends CartState {}

class RemoveCartItemSuccessState extends CartState {}

class RemoveCartItemErrorState extends CartState {
  Failures failures;

  RemoveCartItemErrorState(this.failures);
}

class UpdateItemCountLoadingState extends CartState {}

class UpdateItemCountSuccessState extends CartState {}

class UpdateItemCountErrorState extends CartState {
  Failures failures;

  UpdateItemCountErrorState(this.failures);
}
