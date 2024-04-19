import '../../../../../../data/models/product_model.dart';

class CartEntity {
  CartEntity({
    this.data,
  });

  CartDataEntity? data;
}

class CartDataEntity {
  CartDataEntity({
    this.products,
    this.totalCartPrice,
    this.id,
  });

  List<CartProducts>? products;
  int? totalCartPrice;

  String? id;
}

class CartProducts {
  CartProducts({
    this.id,
    this.count,
    this.product,
    this.price,
  });

  String? id;

  int? count;

  CartProduct? product;
  int? price;
}

class CartProduct {
  CartProduct({
    this.subcategory,
    this.id,
    this.title,
    this.quantity,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
  });

  List<Subcategory>? subcategory;
  String? id;
  String? title;
  int? quantity;
  String? imageCover;
  Category? category;
  Brand? brand;
  num? ratingsAverage;
}
