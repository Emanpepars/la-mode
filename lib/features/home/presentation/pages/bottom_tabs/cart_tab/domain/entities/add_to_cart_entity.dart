class AddToCartEntity {
  AddToCartEntity({
    this.message,
    this.data,
  });

  String? message;
  AddToCartDataEntity? data;
}

class AddToCartDataEntity {
  AddToCartDataEntity({
    this.id,
    this.cartOwner,
    this.products,
    this.totalCartPrice,
  });

  String? id;
  String? cartOwner;
  List<AddToCartProductsEntity>? products;

  int? totalCartPrice;
}

class AddToCartProductsEntity {
  AddToCartProductsEntity({
    this.count,
    this.id,
    this.product,
    this.price,
  });

  int? count;
  String? id;
  String? product;
  int? price;
}
