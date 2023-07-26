import 'package:ecommerce_app/features/Cart/domain/entities/cart_entitie.dart';

class CartModel extends CartEntitie {
  CartModel(
      {required super.status, required super.data, required super.message});

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        status: json["status"],
        message: json["message"] ?? '',
        data: CartData.fromJson(json["data"] ?? {}),
      );
}

class CartData {
  List<CartItem> cartItems;
  double total;

  CartData({
    required this.cartItems,
    required this.total,
  });

  factory CartData.fromJson(Map<String, dynamic> json) => CartData(
        cartItems: List<CartItem>.from(
            json["cart_items"].map((x) => CartItem.fromJson(x)) ?? []),
        total: json["total"]?.toDouble() ?? 0,
      );
}

class CartItem {
  int id;
  int quantity;
  Product product;

  CartItem({
    required this.id,
    required this.quantity,
    required this.product,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
        id: json["id"] ?? -1,
        quantity: json["quantity"] ?? -1,
        product: Product.fromJson(json["product"] ?? {}),
      );
}

class Product {
  int id;
  num price;
  num oldPrice;
  int discount;
  String image;
  String name;
  String description;
  List<String> images;
  bool inFavorites;
  bool inCart;

  Product({
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

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"] ?? -1,
        price: json["price"]?.toDouble() ?? 0,
        oldPrice: json["old_price"]?.toDouble() ?? 0,
        discount: json["discount"] ?? 0,
        image: json["image"] ?? '',
        name: json["name"] ?? '',
        description: json["description"] ?? '',
        images: List<String>.from(json["images"].map((x) => x) ?? []),
        inFavorites: json["in_favorites"],
        inCart: json["in_cart"],
      );
}
