import 'package:dartz/dartz.dart';
import 'package:la_mode/core/error/failure.dart';
import 'package:la_mode/features/home/domain/entities/prduct_entity.dart';
import 'package:la_mode/features/home/domain/repositories/home_domain_repo.dart';

class HomeUseCase {
  HomeDomainRepo homeDomainRepo;

  HomeUseCase(this.homeDomainRepo);

  Future<Either<Failures, ProductEntity>> getAllProduct() =>
      homeDomainRepo.getAllProduct();
}
