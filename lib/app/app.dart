import 'package:ecommerce_app/core/resources/app_theme.dart';
import 'package:ecommerce_app/core/resources/route_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../core/localizations/localization.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        onGenerateRoute: RouteGenerate.getRoutes,
        initialRoute: Routes.splashRoute,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        supportedLocales: const [Locale("en"), Locale("ar")],
        locale: const Locale('en'),
        theme: appTheme(),
        debugShowCheckedModeBanner: false,
       );
  }
}
