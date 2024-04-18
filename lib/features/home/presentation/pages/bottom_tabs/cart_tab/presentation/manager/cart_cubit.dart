import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/product_item.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitialState());

  static CartCubit get(context) => BlocProvider.of(context);

  List<ProductItem> items = [
    ProductItem(
      name: 'T-shirt',
      price: 100,
      rate: 4.5,
      size: 'M',
      color: 'Blue',
      quantity: 1,
    ),
    ProductItem(
      name: 'Jeans',
      price: 50,
      rate: 3.8,
      size: 'L',
      color: 'Red',
      quantity: 2,
    ),
    ProductItem(
      name: 'Dress',
      price: 75,
      rate: 4.2,
      size: 'S',
      color: 'Green',
      quantity: 1,
    ),
  ];

  // for (int i = 0; i < r.data!.length; i++) {
  // totalPrice += (r.data![i].priceAfterDiscount == null
  // ? r.data![i].price!.toDouble()
  //     : r.data![i].priceAfterDiscount!.toDouble());
  // }
}

