import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

abstract final class AppTheme {
  static ThemeData get light {
    final baseTextTheme = GoogleFonts.manropeTextTheme();

    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.paper,
      colorScheme: const ColorScheme.light(
        primary: AppColors.blue,
        onPrimary: Colors.white,
        secondary: AppColors.deepBlue,
        onSecondary: Colors.white,
        surface: AppColors.paperWhite,
        onSurface: AppColors.ink,
        outline: AppColors.line,
      ),
      textTheme: baseTextTheme.copyWith(
        displayLarge: GoogleFonts.instrumentSerif(
          fontSize: 64,
          height: .94,
          color: AppColors.ink,
        ),
        displayMedium: GoogleFonts.instrumentSerif(
          fontSize: 48,
          height: .98,
          color: AppColors.ink,
        ),
        headlineLarge: GoogleFonts.instrumentSerif(
          fontSize: 36,
          height: 1,
          color: AppColors.ink,
        ),
        headlineMedium: GoogleFonts.manrope(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          height: 1.1,
          color: AppColors.ink,
        ),
        titleLarge: GoogleFonts.manrope(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: AppColors.ink,
        ),
        bodyLarge: GoogleFonts.manrope(
          fontSize: 16,
          height: 1.55,
          color: AppColors.ink,
        ),
        bodyMedium: GoogleFonts.manrope(
          fontSize: 14,
          height: 1.5,
          color: AppColors.ink,
        ),
        labelLarge: GoogleFonts.manrope(
          fontSize: 13,
          fontWeight: FontWeight.w700,
          letterSpacing: .2,
        ),
      ),
      navigationBarTheme: const NavigationBarThemeData(
        backgroundColor: AppColors.paperWhite,
        indicatorColor: AppColors.softBlue,
        height: 72,
      ),
      dividerColor: AppColors.line,
    );
  }
}
