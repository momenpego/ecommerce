import '../../data/models/favorite_model.dart';

class FavoriteEntitie{
  bool status;
  dynamic message;
  FavoriteData data;

  FavoriteEntitie({
    required this.data,
    required this.message,
    required this.status
  });

}