import 'package:ecommerce_app/core/resources/app_styles.dart';
import 'package:ecommerce_app/core/resources/extentions.dart';
import 'package:flutter/material.dart';

class TextErrorWidget extends StatelessWidget {
  final String message;
  const TextErrorWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: context.height*0.4,
          ),
          Text(
            message,
            style: AppStyles.headline2(height: context.height),
          ),
        ],
      ),
    );
  }
}
