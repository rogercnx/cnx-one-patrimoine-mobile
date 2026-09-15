import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

/// Thème de l'application : typographie Manrope (texte) + JetBrains Mono
/// (données chiffrées/identifiants), sur la palette [AppColors].
abstract final class AppTheme {
  static TextStyle numeric(TextStyle base) =>
      GoogleFonts.jetBrainsMono(textStyle: base, fontFeatures: const [FontFeature.tabularFigures()]);

  static ThemeData light() {
    final textTheme = GoogleFonts.manropeTextTheme();
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.brand,
        brightness: Brightness.light,
        primary: AppColors.brand,
        surface: AppColors.card,
      ),
      textTheme: textTheme.apply(bodyColor: AppColors.ink, displayColor: AppColors.ink),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.ink,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
      dividerTheme: const DividerThemeData(color: AppColors.lineSoft, thickness: 1, space: 1),
      splashFactory: NoSplash.splashFactory,
    );
  }
}
