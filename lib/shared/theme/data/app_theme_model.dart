import 'package:estudo_rick_xp_flutter/shared/theme/data/app_theme.dart';
import 'package:flutter/material.dart';

class AppThemeModel {
  AppThemeModel({
    required this.theme,
    required this.themeData,
    required this.icon,
  });

  final AppTheme theme;
  final ThemeData themeData;
  final Icon icon;
}
