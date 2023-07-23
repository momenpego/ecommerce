import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failurs.dart';
import 'package:ecommerce_app/features/Category/domain/repositories/category_rep.dart';

class AddOrDeleteCatergoryItemFavoriteUseCase{
  CategoryRepositorie repositorie;
  AddOrDeleteCatergoryItemFavoriteUseCase({required this.repositorie});
  
  Future<Either<Failure,String>>call({required int id})async{
    return await repositorie.addOrDeleteItemFavorite(id: id);
  }
}