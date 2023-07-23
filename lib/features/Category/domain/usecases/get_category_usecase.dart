import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failurs.dart';
import 'package:ecommerce_app/features/Category/domain/entities/category_entitie.dart';
import 'package:ecommerce_app/features/Category/domain/repositories/category_rep.dart';

class GetAllCategoryUseCase {
  CategoryRepositorie repositorie;
  GetAllCategoryUseCase({required this.repositorie});

  Future<Either<Failure, CategoryEtitie>> call() async {
    return await repositorie.getAllCategory();
  }
}
