import 'package:ecommerce_app/features/Category/domain/entities/item_category_entitie.dart';

class CategoryItemsModel extends CategoryItemEntitie {
  CategoryItemsModel(
      {required super.data, required super.message, required super.status});

  factory CategoryItemsModel.fromJson(Map<String, dynamic> json) =>
      CategoryItemsModel(
        status: json["status"],
        message: json["message"],
        data: CategoryItemData.fromJson(json["data"]),
      );
}

class CategoryItemData {
  List<CategoryItemDatum> data;

  CategoryItemData({
    required this.data,
  });

  factory CategoryItemData.fromJson(Map<String, dynamic> json) =>
      CategoryItemData(
        data: List<CategoryItemDatum>.from(
            json["data"].map((x) => CategoryItemDatum.fromJson(x))),
      );
}

class CategoryItemDatum {
  int id;
  double price;
  double oldPrice;
  int discount;
  String image;
  String name;
  String description;
  List<String> images;
  bool inFavorites;
  bool inCart;

  CategoryItemDatum({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
    required this.images,
    required this.inFavorites,
    required this.inCart,
  });

  factory CategoryItemDatum.fromJson(Map<String, dynamic> json) =>
      CategoryItemDatum(
        id: json["id"],
        price: json["price"]?.toDouble(),
        oldPrice: json["old_price"]?.toDouble(),
        discount: json["discount"],
        image: json["image"],
        name: json["name"],
        description: json["description"],
        images: List<String>.from(json["images"].map((x) => x)),
        inFavorites: json["in_favorites"],
        inCart: json["in_cart"],
      );
}
