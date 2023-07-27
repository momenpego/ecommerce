import '../../domain/entities/favorite_entitie.dart';

class FavoriteModel extends FavoriteEntitie {
  FavoriteModel(
      {required super.message, required super.status, required super.data});

  factory FavoriteModel.fromJson(Map<String, dynamic> json) => FavoriteModel(
        status: json["status"],
        message: json["message"],
        data: FavoriteData.fromJson(json["data"]),
      );
}

class FavoriteData {
  List<Datum> data;

  FavoriteData({
    required this.data,
  });

  factory FavoriteData.fromJson(Map<String, dynamic> json) => FavoriteData(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );
}

class Datum {
  int id;
  FavoriteProduct product;

  Datum({
    required this.id,
    required this.product,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        product: FavoriteProduct.fromJson(json["product"]),
      );
}

class FavoriteProduct {
  int id;
  int price;
  int oldPrice;
  int discount;
  String image;
  String name;
  String description;

  FavoriteProduct({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
  });

  factory FavoriteProduct.fromJson(Map<String, dynamic> json) =>
      FavoriteProduct(
        id: json["id"],
        price: json["price"],
        oldPrice: json["old_price"],
        discount: json["discount"],
        image: json["image"],
        name: json["name"],
        description: json["description"],
      );
}
