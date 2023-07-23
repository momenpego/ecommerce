import 'package:ecommerce_app/features/Home/domain/entities/favorite_entitie.dart';

class FavoriteModel extends FavoriteEntitie {
  FavoriteModel({required super.message, required super.status});

  factory FavoriteModel.fromJson(Map<String, dynamic> json) => FavoriteModel(
        status: json["status"],
        message: json["message"],
      );
}
