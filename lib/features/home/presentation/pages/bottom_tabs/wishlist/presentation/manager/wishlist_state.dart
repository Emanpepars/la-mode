import 'package:la_mode/core/error/failure.dart';

abstract class WishlistState {}

class WishlistInitial extends WishlistState {}

class GetWishlistLoading extends WishlistState {}

class GetWishlistSuccess extends WishlistState {}

class GetWishlistFailure extends WishlistState {
  Failures failures;

  GetWishlistFailure(this.failures);
}

class AddWishLoading extends WishlistState {}

class AddWishSuccess extends WishlistState {}

class AddWishFailure extends WishlistState {
  Failures failures;

  AddWishFailure(this.failures);
}
