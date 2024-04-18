import 'package:la_mode/features/home/domain/entities/prduct_entity.dart';

class GetWishlistEntity {
  GetWishlistEntity({
    this.data,
    this.count,
  });

  List<ProductDataEntity>? data;
  int? count;
}
