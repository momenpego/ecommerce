import 'package:ecommerce_app/core/Model/product_model.dart';
import 'package:ecommerce_app/features/Category/data/models/navgigat_models.dart';
import 'package:ecommerce_app/features/Category/presentation/pages/category_product_page.dart';
import 'package:ecommerce_app/features/Main/presentation/pages/main_page.dart';
import 'package:ecommerce_app/features/SignIn/presentation/pages/log_in_page.dart';
import 'package:ecommerce_app/features/SignUp/presentation/pages/signup_page.dart';
import 'package:ecommerce_app/features/Splash/presentation/pages/splash_page.dart';
import 'package:flutter/material.dart';

import '../screens/product_detailes_screen.dart';

class Routes {
  static const String splashRoute = '/';
  static const String logIn = '/login';
  static const String signUp = '/signup';
  static const String mainPage = '/main';
  static const String categoryItems = '/category';
  static const String productPage = '/product';
}

class RouteGenerate {
  static Route getRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case Routes.logIn:
        return MaterialPageRoute(builder: (_) => const LogInPage());
      case Routes.categoryItems:
        var args = routeSettings.arguments as NavCategoryProducts;
        return MaterialPageRoute(
          builder: (_) => CategoryProductPage(
            arg: args,
          ),
        );
      case Routes.signUp:
        return MaterialPageRoute(builder: (_) => const SignUpPage());
      case Routes.mainPage:
        return MaterialPageRoute(builder: (_) => const MainPage());
      case Routes.productPage:
        var model = routeSettings.arguments as ProductModel;
        return MaterialPageRoute(
            builder: (_) => ProductDetailesPage(model: model));
      default:
        return MaterialPageRoute(builder: (_) => _unFoundedScreen());
    }
  }
}

Widget _unFoundedScreen() {
  return const Scaffold(
    body: Center(
      child: Text(
        'Un founded Route',
        style: TextStyle(
            fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
      ),
    ),
  );
}
