import '../../data/models/home_model.dart';

class HomeEntitie {
  bool status;
  dynamic message;
  Data data;
  HomeEntitie(
      {required this.data, required this.message, required this.status});
}
