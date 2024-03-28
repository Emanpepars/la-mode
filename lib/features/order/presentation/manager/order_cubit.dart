import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home/presentation/pages/bottom_tabs/cart_tab/domain/repositories/product_item.dart';
import '../../domain/entities/order_item.dart';
import 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitial());

  static OrderCubit get(context) => BlocProvider.of(context);
  List<OrderItem> orders = [
    OrderItem(
      orderNumber: 240254,
      price: 390,
      state: "Shipping",
      date: DateTime(2024, 3, 28, 12, 20),
      discount: 10,
      delivery: 5,
      items: [
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
      ],
      placed: true,
      shipped: true,
      pickedUp: false,
      delivered: false,
    ),
    OrderItem(
      orderNumber: 4,
      price: 220,
      state: 'Delivered',
      date: DateTime(2023, 9, 5, 10, 12),
      discount: 25,
      delivery: 12,
      items: [
        ProductItem(
          quantity: 2,
          name: 'T-shirt',
          price: 90,
          rate: 4.6,
          size: 'M',
          color: 'White',
        ),
        ProductItem(
          quantity: 1,
          name: 'Blue Jeans',
          price: 40,
          rate: 4.0,
          size: 'S',
          color: 'Gray',
        ),
      ],
      placed: true,
      shipped: true,
      pickedUp: true,
      delivered: true,
    ),
    OrderItem(
      orderNumber: 2,
      price: 150,
      state: 'Pending',
      date: DateTime(2024, 2, 28, 1, 15),
      discount: 10,
      delivery: 5,
      items: [
        ProductItem(
          quantity: 1,
          name: 'T-shirt',
          price: 75,
          rate: 4.2,
          size: 'S',
          color: 'Green',
        ),
      ],
      placed: false,
      shipped: false,
      pickedUp: false,
      delivered: false,
    ),
    OrderItem(
      orderNumber: 3,
      price: 180,
      state: 'Canceled',
      date: DateTime(2023, 12, 1, 5, 30),
      discount: 15,
      delivery: 8,
      items: [
        ProductItem(
          quantity: 3,
          name: 'T-shirt',
          price: 60,
          rate: 4.7,
          size: 'L',
          color: 'Black',
        ),
      ],
      placed: false,
      shipped: false,
      pickedUp: false,
      delivered: false,
    ),
  ];
}
