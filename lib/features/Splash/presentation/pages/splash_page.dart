import 'package:ecommerce_app/core/SharedPref/shared_helper.dart';
import 'package:ecommerce_app/core/resources/route_manger.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), ()async {
    await SharedHelper.getstring(key: 'TOKEN') ==null?  Navigator.pushNamedAndRemoveUntil(
          context, Routes.logIn, (route) => false) :Navigator.pushNamedAndRemoveUntil(
          context, Routes.mainPage, (route) => false) ;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: Colors.blue,
        ),
      ),
    );
  }
}
