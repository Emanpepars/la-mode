import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_mode/features/home/domain/entities/prduct_entity.dart';
import 'package:la_mode/features/home/presentation/pages/bottom_tabs/wishlist/data/repositories/wishlist_data_repo.dart';
import 'package:la_mode/features/home/presentation/pages/bottom_tabs/wishlist/domain/use_cases/wishlist_use_case.dart';
import 'package:la_mode/features/home/presentation/pages/bottom_tabs/wishlist/presentation/manager/wishlist_state.dart';

import '../../data/data_sources/wishlist_dto.dart';
import '../../domain/repositories/wishlist_domain_repo.dart';

class WishlistCubit extends Cubit<WishlistState> {
  WishlistDto wishlistDto;
  late WishlistDomainRepo wishlistDomainRepo;

  WishlistCubit(this.wishlistDto) : super(WishlistInitial()) {
    wishlistDomainRepo = WishlistDataRepo(wishlistDto);
  }

  static WishlistCubit get(context) => BlocProvider.of(context);

  List<ProductDataEntity> wishlist = [];
  double totalPrice = 0;

  getWishlist() async {
    emit(GetWishlistLoading());
    WishlistUseCase wishlistUseCase = WishlistUseCase(wishlistDomainRepo);

    var response = await wishlistUseCase.getWishlist();

    response.fold((l) => emit(GetWishlistFailure(l)), (r) {
      wishlist = r.data!;
      emit(GetWishlistSuccess());
    });
  }

  addWish(String productId) async {
    emit(AddWishLoading());
    WishlistUseCase wishlistUseCase = WishlistUseCase(wishlistDomainRepo);

    var response = await wishlistUseCase.getWishlist();

    response.fold((l) => emit(AddWishFailure(l)), (r) {
      wishlist = r.data!;
      emit(AddWishSuccess());
    });
  }
}
