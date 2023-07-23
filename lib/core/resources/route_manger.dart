import 'package:ecommerce_app/features/Main/presentation/pages/main_page.dart';
import 'package:ecommerce_app/features/SignIn/presentation/pages/log_in_page.dart';
import 'package:ecommerce_app/features/SignUp/presentation/pages/signup_page.dart';
import 'package:ecommerce_app/features/Splash/presentation/pages/splash_page.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String splashRoute = '/';
  static const String logIn = '/login';
  static const String signUp = '/signup';
  static const String mainPage = '/main';
}

class RouteGenerate {
  static Route getRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case Routes.logIn:
        return MaterialPageRoute(builder: (_) => const LogInPage());
      case Routes.signUp:
        return MaterialPageRoute(builder: (_) => const SignUpPage());
      case Routes.mainPage:
        return MaterialPageRoute(builder: (_) => const MainPage());
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
