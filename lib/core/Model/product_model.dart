class ProductModel {
  int id;
  double price;
  double oldPrice;
  List<String> images;
  int discount;
  String name;
  String description;
  bool inCart;
  ProductModel(
      {required this.id,
      required this.description,
      required this.discount,
      required this.images,
      required this.inCart,
      required this.name,
      required this.oldPrice,
      required this.price});
}
