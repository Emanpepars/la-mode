import 'package:la_mode/features/home/presentation/pages/bottom_tabs/cart_tab/domain/entities/add_to_cart_entity.dart';

class AddToCartModel extends AddToCartEntity {
  AddToCartModel({
    this.status,
    super.message,
    this.numOfCartItems,
    super.data,
  });

  AddToCartModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    numOfCartItems = json['numOfCartItems'];
    data =
        json['data'] != null ? AddToCartDataModel.fromJson(json['data']) : null;
  }

  String? status;
  int? numOfCartItems;
}

class AddToCartDataModel extends AddToCartDataEntity {
  AddToCartDataModel({
    super.id,
    super.cartOwner,
    super.products,
    this.createdAt,
    this.updatedAt,
    this.v,
    super.totalCartPrice,
  });

  AddToCartDataModel.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(AddToCartProductsModel.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }

  String? createdAt;
  String? updatedAt;
  int? v;
}

class AddToCartProductsModel extends AddToCartProductsEntity {
  AddToCartProductsModel({
    super.count,
    super.id,
    super.product,
    super.price,
  });

  AddToCartProductsModel.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'];
    price = json['price'];
  }
}
