import 'package:la_mode/core/error/failure.dart';

abstract class WishlistState {}

class WishlistInitial extends WishlistState {}

class GetWishlistLoading extends WishlistState {}

class GetWishlistSuccess extends WishlistState {}

class GetWishlistFailure extends WishlistState {
  Failures failures;

  GetWishlistFailure(this.failures);
}
