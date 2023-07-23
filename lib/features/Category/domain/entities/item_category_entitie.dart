import '../../data/models/category_item_model.dart';

class CategoryItemEntitie {
  bool status;
  dynamic message;
  CategoryItemData data;
  CategoryItemEntitie(
      {required this.data, required this.message, required this.status});
}
