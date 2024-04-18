
import 'package:la_mode/features/home/presentation/pages/bottom_tabs/cart_tab/domain/entities/cart_entity.dart';

class OrderItem {
  final String orderNumber;
  final int price;
  final String state;
  final bool placed;
  final bool shipped;
  final bool pickedUp;
  final bool delivered;
  final DateTime date;
  final int discount;
  final int delivery;
  final List<CartProducts> items;

  OrderItem({
    required this.placed,
    required this.shipped,
    required this.pickedUp,
    required this.delivered,
    required this.orderNumber,
    required this.price,
    required this.state,
    required this.date,
    required this.discount,
    required this.delivery,
    required this.items,
  });
}
