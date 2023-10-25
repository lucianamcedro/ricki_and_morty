import 'package:estudo_rick_xp_flutter/shared/theme/data/app_theme.dart';
import 'package:estudo_rick_xp_flutter/shared/theme/data/app_theme_model.dart';
import 'package:flutter/material.dart';

final themes = {
  AppTheme.light: AppThemeModel(
    theme: AppTheme.light,
    themeData: ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      cardTheme: const CardTheme(elevation: 4.0),
    ),
  ),
  AppTheme.dark: AppThemeModel(
    theme: AppTheme.dark,
    themeData: ThemeData(
      brightness: Brightness.dark,
      useMaterial3: true,
    ),
  ),
};
