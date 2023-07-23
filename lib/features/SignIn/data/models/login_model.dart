import 'package:ecommerce_app/features/SignIn/domain/entities/login_entitie.dart';

class LogInModel extends LogInEntitie {
  LogInModel(
      {required super.data, required super.message, required super.status});

  factory LogInModel.fromJson(Map<String, dynamic> json) => LogInModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]??{}),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  int id;
  String name;
  String email;
  String phone;
  String image;
  int points;
  double credit;
  String token;

  Data({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    required this.points,
    required this.credit,
    required this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"]??-1,
        name: json["name"]??'',
        email: json["email"]??'',
        phone: json["phone"]??"",
        image: json["image"]??'',
        points: json["points"]??-1,
        credit: json["credit"]?.toDouble()??-1,
        token: json["token"]??'',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "image": image,
        "points": points,
        "credit": credit,
        "token": token,
      };
}
