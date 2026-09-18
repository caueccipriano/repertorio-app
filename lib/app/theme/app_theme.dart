import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

abstract final class AppTheme {
  static ThemeData lightWith({
    bool highContrast = false,
    bool reduceMotion = false,
    bool largeTapTargets = false,
  }) {
    final theme = light;

    return theme.copyWith(
      colorScheme: highContrast
          ? const ColorScheme.light(
              primary: Color(0xFF002F9E),
              onPrimary: Colors.white,
              secondary: Color(0xFF001B60),
              onSecondary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black,
              outline: Colors.black,
            )
          : theme.colorScheme,
      scaffoldBackgroundColor:
          highContrast ? Colors.white : theme.scaffoldBackgroundColor,
      materialTapTargetSize: largeTapTargets
          ? MaterialTapTargetSize.padded
          : theme.materialTapTargetSize,
      iconButtonTheme: largeTapTargets
          ? IconButtonThemeData(
              style: IconButton.styleFrom(
                minimumSize: const Size(52, 52),
              ),
            )
          : theme.iconButtonTheme,
      pageTransitionsTheme: reduceMotion
          ? const PageTransitionsTheme(
              builders: {
                TargetPlatform.android: _NoTransitionsBuilder(),
                TargetPlatform.iOS: _NoTransitionsBuilder(),
                TargetPlatform.macOS: _NoTransitionsBuilder(),
                TargetPlatform.windows: _NoTransitionsBuilder(),
                TargetPlatform.linux: _NoTransitionsBuilder(),
              },
            )
          : theme.pageTransitionsTheme,
    );
  }

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
          letterSpacing: -2,
          color: AppColors.ink,
        ),
        displayMedium: GoogleFonts.instrumentSerif(
          fontSize: 48,
          height: .98,
          letterSpacing: -1.4,
          color: AppColors.ink,
        ),
        headlineLarge: GoogleFonts.instrumentSerif(
          fontSize: 36,
          height: 1,
          letterSpacing: -.7,
          color: AppColors.ink,
        ),
        headlineMedium: GoogleFonts.manrope(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          height: 1.1,
          letterSpacing: -.8,
          color: AppColors.ink,
        ),
        titleLarge: GoogleFonts.manrope(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          letterSpacing: -.35,
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
      appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: false,
        backgroundColor: AppColors.paper,
        foregroundColor: AppColors.ink,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: GoogleFonts.manrope(
          color: AppColors.ink,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.ink,
          textStyle: GoogleFonts.manrope(
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          textStyle: GoogleFonts.manrope(
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.paperWhite,
        selectedColor: AppColors.softBlue,
        side: const BorderSide(color: AppColors.ink),
        shape: const StadiumBorder(),
        labelStyle: GoogleFonts.manrope(
          fontSize: 13,
          fontWeight: FontWeight.w600,
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: AppColors.paperWhite,
        indicatorColor: AppColors.softBlue,
        height: 72,
        labelTextStyle: WidgetStatePropertyAll(
          GoogleFonts.manrope(
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      dividerColor: AppColors.line,
    );
  }
}


class _NoTransitionsBuilder extends PageTransitionsBuilder {
  const _NoTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return child;
  }
}
