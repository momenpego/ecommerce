import 'package:ecommerce_app/features/Category/data/models/all_category_model.dart';
import 'package:ecommerce_app/features/Category/presentation/widgets/category_item_widget.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final List<CategoryDatum> list;
  const CategoryWidget({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: list.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 1.12),
        itemBuilder: (context, index) {
          return CategoryItemWidget(
            name: list[index].name,
            id: list[index].id,
            image: list[index].image,
          );
        },
      ),
    );
  }
}
