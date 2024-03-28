
import '../../../home/presentation/pages/bottom_tabs/cart_tab/domain/repositories/product_item.dart';

class OrderItem {
  final int orderNumber;
  final int price;
  final String state;
  final DateTime date;
  final int discount;
  final int delivery;
  final List<ProductItem> items;

  OrderItem({
    required this.orderNumber,
    required this.price,
    required this.state,
    required this.date,
    required this.discount,
    required this.delivery,
    required this.items,
  });
}
