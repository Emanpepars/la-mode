import 'package:flutter_bloc/flutter_bloc.dart';
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
    ),
    ProductItem(
      name: 'Jeans',
      price: 50,
      rate: 3.8,
      size: 'L',
      color: 'Red',
    ),
    ProductItem(
      name: 'Dress',
      price: 75,
      rate: 4.2,
      size: 'S',
      color: 'Green',
    ),

  ];
}

class ProductItem {
  final String name;
  final int price;
  final double rate;
  final String size;
  final String color;

  ProductItem({
    required this.name,
    required this.price,
    required this.rate,
    required this.size,
    required this.color,
  });
}
