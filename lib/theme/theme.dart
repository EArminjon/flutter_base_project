import 'package:flutter/material.dart';

///
/// RULE OF THE THEME
///
/// Don't use hardcoded color (0XFF23...) create variable instead.
/// Use Theme.of(context).someThing
/// Must of use case in code (not here) is Theme.of(context).someThing or with .copyWith(variant color...)
class AppTheme {
  /// Copy default light theme to override it properly
  ThemeData light(BuildContext context) => ThemeData.light().copyWith();

  /// Copy default dark theme to override it properly
  ThemeData dark(BuildContext context) => ThemeData.dark().copyWith();
}
