import 'package:dartz/dartz.dart';

import '../../../../core/errors/failurs.dart';
import '../repositories/category_rep.dart';

class AddOrDeleteCatergoryItemCartUseCase {
  CategoryRepositorie repositorie;
  AddOrDeleteCatergoryItemCartUseCase({required this.repositorie});

  Future<Either<Failure, String>> call({required int id}) async {
    return await repositorie.addOrDeleteItemCart(id: id);
  }
}
