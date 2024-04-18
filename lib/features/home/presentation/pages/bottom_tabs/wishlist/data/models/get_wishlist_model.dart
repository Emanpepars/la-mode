import 'package:la_mode/features/home/presentation/pages/bottom_tabs/wishlist/domain/entities/get_wishlist_entity.dart';

import '../../../../../../data/models/product_model.dart';

class GetWishlistModel extends GetWishlistEntity {
  GetWishlistModel({
    this.status,
    super.count,
    super.data,
  });

  GetWishlistModel.fromJson(dynamic json) {
    status = json['status'];
    count = json['count'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }

  String? status;
}
