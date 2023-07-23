import 'package:ecommerce_app/core/localizations/localization.dart';
import 'package:flutter/widgets.dart';

extension ValueX on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
  String? translate({required String key1}) {
    return AppLocalizations.of(this)!.translate(key1)!;
  }
}
