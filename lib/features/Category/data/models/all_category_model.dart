import 'package:ecommerce_app/features/Category/domain/entities/category_entitie.dart';

class CategoryModel extends CategoryEtitie {
  CategoryModel(
      {required super.data, required super.message, required super.status});

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        status: json["status"],
        message: json["message"],
        data: CategoryData.fromJson(json["data"]),
      );
}

class CategoryData {
  List<CategoryDatum> data;

  CategoryData({
    required this.data,
  });

  factory CategoryData.fromJson(Map<String, dynamic> json) => CategoryData(
        data: List<CategoryDatum>.from(
            json["data"].map((x) => CategoryDatum.fromJson(x))),
      );
}

class CategoryDatum {
  int id;
  String name;
  String image;

  CategoryDatum({
    required this.id,
    required this.name,
    required this.image,
  });

  factory CategoryDatum.fromJson(Map<String, dynamic> json) => CategoryDatum(
        id: json["id"],
        name: json["name"],
        image: json["image"],
      );
}
