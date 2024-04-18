import 'package:la_mode/features/home/presentation/pages/bottom_tabs/wishlist/domain/entities/add_wish_entity.dart';

class AddWishModel extends AddWishEntity {
  AddWishModel({
    this.status,
    super.message,
    this.data,
  });

  AddWishModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? json['data'].cast<String>() : [];
  }

  String? status;
  List<String>? data;
}
