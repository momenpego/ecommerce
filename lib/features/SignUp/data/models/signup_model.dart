import 'package:ecommerce_app/features/SignUp/domain/entities/sign_up_entitie.dart';

class SignUpModel extends SignUpEntitie {
  SignUpModel(
      {required super.data, required super.message, required super.status});

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        status: json["status"],
        message: json["message"]??'',
        data: Data.fromJson(json["data"]??{}),
      );
}

class Data {
  String name;
  String phone;
  String email;
  int id;
  String image;

  Data({
    required this.name,
    required this.phone,
    required this.email,
    required this.id,
    required this.image,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["name"]??'',
        phone: json["phone"]??'',
        email: json["email"]??'',
        id: json["id"]??-1,
        image: json["image"]??'',
      );
}
