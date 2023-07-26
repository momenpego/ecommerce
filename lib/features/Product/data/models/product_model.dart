import '../../domain/entities/product_entitie.dart';

class ProductModel extends ProductEntitie {
  ProductModel(
      {required super.id,
      required super.description,
      required super.discount,
      required super.images,
      required super.inCart,
      required super.name,
      required super.oldPrice,
      required super.price});
}
