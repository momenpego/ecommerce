import 'package:ecommerce_app/core/Http/dio_req.dart';
import 'package:ecommerce_app/core/SharedPref/shared_helper.dart';
import 'package:flutter/material.dart';
import 'injection_cont.dart' as di;

import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.injectAll();
  await SharedHelper.initshared();
  await Diorequest.initdio();
  runApp(const MyApp());
}
