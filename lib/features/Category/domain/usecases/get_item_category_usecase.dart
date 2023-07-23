import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failurs.dart';
import 'package:ecommerce_app/features/Category/domain/entities/item_category_entitie.dart';
import 'package:ecommerce_app/features/Category/domain/repositories/category_rep.dart';

class GetCategoryItemUseCase {
  CategoryRepositorie repositorie;
  GetCategoryItemUseCase({required this.repositorie});

  Future<Either<Failure, CategoryItemEntitie>> call({required int id}) async {
    return await repositorie.getCategoryItems(id: id);
  }
}
