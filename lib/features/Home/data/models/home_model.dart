import 'package:ecommerce_app/features/Home/domain/entities/home_entitie.dart';

class HomeModel extends HomeEntitie {
  HomeModel(
      {required super.data, required super.message, required super.status});

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        status: json["status"],
        message: json["message"] ?? '',
        data: Data.fromJson(json["data"] ?? {}),
      );
}

class Data {
  List<HomeBanner> banners;
  List<HomeProduct> products;
  String ad;

  Data({
    required this.banners,
    required this.products,
    required this.ad,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        banners:
            List<HomeBanner>.from(json["banners"].map((x) => HomeBanner.fromJson(x))),
        products: List<HomeProduct>.from(
            json["products"].map((x) => HomeProduct.fromJson(x))),
        ad: json["ad"],
      );
}

class HomeBanner {
  int id;
  String image;
  dynamic category;
  dynamic product;

  HomeBanner({
    required this.id,
    required this.image,
    this.category,
    this.product,
  });

  factory HomeBanner.fromJson(Map<String, dynamic> json) => HomeBanner(
        id: json["id"] ?? -1,
        image: json["image"] ?? '',
        category: json["category"] ?? {},
        product: json["product"] ?? {},
      );
}

class HomeProduct {
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

  HomeProduct({
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

  factory HomeProduct.fromJson(Map<String, dynamic> json) => HomeProduct(
        id: json["id"] ?? -1,
        price: json["price"]?.toDouble() ?? -1,
        oldPrice: json["old_price"]?.toDouble() ?? -1,
        discount: json["discount"] ?? -1,
        image: json["image"] ?? '',
        name: json["name"] ?? '',
        description: json["description"] ?? '',
        images: List<String>.from(json["images"].map((x) => x) ?? []),
        inFavorites: json["in_favorites"],
        inCart: json["in_cart"],
      );
}
