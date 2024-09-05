import 'package:corelab_app_challenge/ui/themes/app_colors_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static get theme => ThemeData(
        primaryColor: AppColorsTheme.primaryColor,
        appBarTheme: const AppBarTheme(color: AppColorsTheme.primaryColor, elevation: 0),
        scaffoldBackgroundColor: AppColorsTheme.secondaryColor,
        progressIndicatorTheme: const ProgressIndicatorThemeData(color: AppColorsTheme.primaryColor),
      );
}
