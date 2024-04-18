import 'package:dartz/dartz.dart';
import 'package:la_mode/core/error/failure.dart';
import 'package:la_mode/features/home/data/data_sources/home_dto.dart';
import 'package:la_mode/features/home/domain/entities/prduct_entity.dart';
import 'package:la_mode/features/home/domain/repositories/home_domain_repo.dart';

class HomeDataRepo implements HomeDomainRepo {
  HomeDto homeDto;

  HomeDataRepo(this.homeDto);

  @override
  Future<Either<Failures, ProductEntity>> getAllProduct() =>
      homeDto.getAllProduct();
}
