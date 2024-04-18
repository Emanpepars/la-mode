import 'package:dartz/dartz.dart';
import 'package:la_mode/core/error/failure.dart';
import 'package:la_mode/features/home/domain/entities/prduct_entity.dart';

abstract class HomeDomainRepo {
  Future<Either<Failures, ProductEntity>> getAllProduct();
}
