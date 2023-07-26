class ProductEntitie {
  int id;
  double price;
  double oldPrice;
  List<String> images;
  int discount;
  String name;
  String description;
  bool inCart;
    ProductEntitie(
      {required this.id,
      required this.description,
      required this.discount,
      required this.images,
      required this.inCart,
      required this.name,
      required this.oldPrice,
      required this.price});
}
