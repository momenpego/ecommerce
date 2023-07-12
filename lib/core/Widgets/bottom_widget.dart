// ignore_for_file: must_be_immutable

import 'package:ecommerce_app/core/resources/extentions.dart';
import 'package:flutter/material.dart';

import '../resources/app_styles.dart';

class BottomWidget extends StatelessWidget {
  bool isLoading;
  String name;
  void Function() onTap;
  BottomWidget(
      {super.key,
      required this.isLoading,
      required this.name,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: context.height * 0.01, horizontal: context.height * 0.05),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: context.height * 0.07,
          width: double.infinity,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 25, 97, 157),
              borderRadius: BorderRadius.circular(15)),
          child: Center(
            child: !isLoading
                ? Text(
                    name,
                    style: AppStyles.bottom(height: context.height),
                  )
                : const CircularProgressIndicator(
                    color: Colors.white,
                  ),
          ),
        ),
      ),
    );
  }
}
