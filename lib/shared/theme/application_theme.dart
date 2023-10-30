// ignore_for_file: avoid_classes_with_only_static_members

import 'package:estudo_rick_xp_flutter/shared/theme/data/app_theme.dart';
import 'package:estudo_rick_xp_flutter/shared/theme/data/app_theme_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ApplicationTheme {
  static AppThemeModel? byName(String themeName) {
    try {
      return themes[AppTheme.values.byName(themeName)];
    } catch (_) {
      return themes.entries.first.value;
    }
  }

  static final themes = {
    AppTheme.light: AppThemeModel(
      theme: AppTheme.light,
      themeData: ThemeData(
        brightness: Brightness.light,
        cardTheme: const CardTheme(elevation: 4.0),
      ),
      icon: const Icon(
        Icons.light_mode,
      ),
    ),
    AppTheme.dark: AppThemeModel(
      theme: AppTheme.dark,
      themeData: ThemeData(
        brightness: Brightness.dark,
      ),
      icon: const Icon(
        Icons.dark_mode,
      ),
    ),
    AppTheme.halloween: AppThemeModel(
      theme: AppTheme.halloween,
      themeData: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.orange[100],
        textTheme: GoogleFonts.emilysCandyTextTheme(),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.orange,
        ),
      ),
      icon: const Icon(
        Icons.forest,
      ),
    ),
    AppTheme.piano: AppThemeModel(
      theme: AppTheme.piano,
      themeData: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.emilysCandyTextTheme(),
        cardTheme: const CardTheme(
          elevation: 1.0,
          color: Colors.white,
        ),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: const MaterialColor(0xFF000000, <int, Color>{
            50: Color(0xFF000000),
            100: Color(0xFF000000),
            200: Color(0xFF000000),
            300: Color(0xFF000000),
            400: Color(0xFF000000),
            500: Color(0xFF000000),
            600: Color(0xFF000000),
            700: Color(0xFF000000),
            800: Color(0xFF000000),
            900: Color(0xFF000000),
          }),
        ),
      ),
      icon: const Icon(
        Icons.piano,
      ),
    ),
  };
}
