import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_mode/features/home/presentation/pages/bottom_tabs/cart_tab/domain/use_cases/cart_use_case.dart';
import '../../data/data_sources/cart_dto.dart';
import '../../data/repositories/cart_data_repo.dart';
import '../../domain/entities/cart_entity.dart';
import '../../domain/repositories/cart_domain_repo.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartDto cartDto;

  late CartDomainRepo cartDomainRepo;

  CartCubit(this.cartDto) : super(CartInitialState()) {
    cartDomainRepo = CartDataRepo(cartDto);
  }

  static CartCubit get(context) => BlocProvider.of(context);

  List<CartProducts> products = [];
  int totalCartPrice = 0;

  getCartItems() async {
    emit(GetCartItemLoadingState());
    CartUseCase cartUseCase = CartUseCase(cartDomainRepo);
    var response = await cartUseCase.getCartItems();

    response.fold((l) => emit(GetCartItemErrorState(l)), (r) {
      products = r.data!.products!;
      totalCartPrice = r.data!.totalCartPrice!;
      emit(GetCartItemSuccessState(r.data!));
    });
  }

  addItemToCart(String productId) async {
    emit(AddCartItemLoadingState());
    CartUseCase cartUseCase = CartUseCase(cartDomainRepo);
    var response = await cartUseCase.addItemToCart(productId);

    response.fold((l) {
      emit(AddCartItemErrorState(l));
    }, (r) {
      getCartItems();
      emit(AddCartItemSuccessState());
    });
  }

  removeItemFromCart(String productId) async {
    emit(RemoveCartItemLoadingState());
    CartUseCase cartUseCase = CartUseCase(cartDomainRepo);
    var response = await cartUseCase.removeItemFromCart(productId);
    response.fold((l) {
      print(l.message.toString());
      emit(RemoveCartItemErrorState(l));
    }, (r) {
      getCartItems();
      emit(RemoveCartItemSuccessState());
    });
  }

  updateItemCountCart(String productId, int count) async {
    emit(UpdateItemCountLoadingState());
    CartUseCase cartUseCase = CartUseCase(cartDomainRepo);
    var response = await cartUseCase.updateItemCountCart(productId, count);
    response.fold((l) {
      print(l.message.toString());
      emit(UpdateItemCountErrorState(l));
    }, (r) {
      getCartItems();
      emit(UpdateItemCountSuccessState());
    });
  }
}
