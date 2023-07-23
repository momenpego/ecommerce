import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failurs.dart';
import 'package:ecommerce_app/features/Home/domain/entities/home_entitie.dart';
import 'package:ecommerce_app/features/Home/domain/repositories/home_repo.dart';

class GetHomeDataUseCase{
  HomeRepositorie repositorie;
  GetHomeDataUseCase({required this.repositorie});

  Future<Either<Failure,HomeEntitie>> call()async{
    return await repositorie.getHomeData();
  }
}