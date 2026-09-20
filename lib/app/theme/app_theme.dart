import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

abstract final class AppTheme {
  static const darkBackground = Color(0xFF101116);
  static const darkSurface = Color(0xFF191B22);
  static const darkSurfaceRaised = Color(0xFF22252E);
  static const darkText = Color(0xFFF5F2EA);
  static const darkMuted = Color(0xFFA7A6A1);
  static const darkLine = Color(0xFF363A46);
  static const darkBlue = Color(0xFF7595EF);

  static ThemeData lightWith({
    bool highContrast = false,
    bool reduceMotion = false,
    bool largeTapTargets = false,
  }) {
    final theme = light;

    return _accessibility(
      theme.copyWith(
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
      ),
      reduceMotion: reduceMotion,
      largeTapTargets: largeTapTargets,
    );
  }

  static ThemeData darkWith({
    bool highContrast = false,
    bool reduceMotion = false,
    bool largeTapTargets = false,
  }) {
    final theme = dark;

    return _accessibility(
      theme.copyWith(
        colorScheme: highContrast
            ? const ColorScheme.dark(
                primary: Color(0xFF9AB2FF),
                onPrimary: Colors.black,
                secondary: Color(0xFFC7D3FF),
                onSecondary: Colors.black,
                surface: Color(0xFF090A0D),
                onSurface: Colors.white,
                outline: Colors.white,
              )
            : theme.colorScheme,
        scaffoldBackgroundColor:
            highContrast ? Colors.black : theme.scaffoldBackgroundColor,
      ),
      reduceMotion: reduceMotion,
      largeTapTargets: largeTapTargets,
    );
  }

  static ThemeData _accessibility(
    ThemeData theme, {
    required bool reduceMotion,
    required bool largeTapTargets,
  }) {
    return theme.copyWith(
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
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.paper,
      colorScheme: const ColorScheme.light(
        primary: AppColors.blue,
        onPrimary: Colors.white,
        secondary: AppColors.deepBlue,
        onSecondary: Colors.white,
        surface: AppColors.paperWhite,
        onSurface: AppColors.ink,
        outline: AppColors.line,
        surfaceContainerHighest: AppColors.softBlue,
        onSurfaceVariant: AppColors.muted,
      ),
      textTheme: _textTheme(
        baseTextTheme,
        text: AppColors.ink,
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
          textStyle: GoogleFonts.manrope(fontWeight: FontWeight.w700),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          textStyle: GoogleFonts.manrope(fontWeight: FontWeight.w700),
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
          color: AppColors.ink,
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: AppColors.paperWhite,
        indicatorColor: AppColors.softBlue,
        indicatorShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: AppColors.line),
        ),
        height: 70,
        iconTheme: WidgetStateProperty.resolveWith<IconThemeData>((states) {
          final selected = states.contains(WidgetState.selected);
          return IconThemeData(
            color: selected ? AppColors.blue : AppColors.muted,
            size: selected ? 24 : 22,
          );
        }),
        labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((states) {
          final selected = states.contains(WidgetState.selected);
          return GoogleFonts.manrope(
            color: selected ? AppColors.ink : AppColors.muted,
            fontSize: 11,
            fontWeight: selected ? FontWeight.w800 : FontWeight.w600,
            letterSpacing: -.15,
          );
        }),
      ),
      dividerColor: AppColors.line,
    );
  }

  static ThemeData get dark {
    final baseTextTheme = GoogleFonts.manropeTextTheme(
      ThemeData.dark().textTheme,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: darkBackground,
      colorScheme: const ColorScheme.dark(
        primary: darkBlue,
        onPrimary: Color(0xFF071332),
        secondary: Color(0xFFB7C7FF),
        onSecondary: Color(0xFF09122C),
        surface: darkSurface,
        onSurface: darkText,
        outline: darkLine,
        surfaceContainerHighest: darkSurfaceRaised,
        onSurfaceVariant: darkMuted,
      ),
      textTheme: _textTheme(
        baseTextTheme,
        text: darkText,
      ),
      appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: false,
        backgroundColor: darkBackground,
        foregroundColor: darkText,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: GoogleFonts.manrope(
          color: darkText,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: darkText,
          textStyle: GoogleFonts.manrope(fontWeight: FontWeight.w700),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: darkBlue,
          foregroundColor: const Color(0xFF071332),
          textStyle: GoogleFonts.manrope(fontWeight: FontWeight.w800),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: darkText,
          side: const BorderSide(color: darkLine),
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: darkSurface,
        selectedColor: const Color(0xFF26365E),
        side: const BorderSide(color: darkLine),
        shape: const StadiumBorder(),
        labelStyle: GoogleFonts.manrope(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: darkText,
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: const Color(0xFF15171D),
        indicatorColor: const Color(0xFF26365E),
        indicatorShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: darkLine),
        ),
        height: 70,
        iconTheme: WidgetStateProperty.resolveWith<IconThemeData>((states) {
          final selected = states.contains(WidgetState.selected);
          return IconThemeData(
            color: selected ? darkBlue : darkMuted,
            size: selected ? 24 : 22,
          );
        }),
        labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((states) {
          final selected = states.contains(WidgetState.selected);
          return GoogleFonts.manrope(
            color: selected ? darkText : darkMuted,
            fontSize: 11,
            fontWeight: selected ? FontWeight.w800 : FontWeight.w600,
            letterSpacing: -.15,
          );
        }),
      ),
      dividerColor: darkLine,
    );
  }

  static TextTheme _textTheme(
    TextTheme base, {
    required Color text,
  }) {
    return base.copyWith(
      displayLarge: GoogleFonts.instrumentSerif(
        fontSize: 64,
        height: .94,
        letterSpacing: -2,
        color: text,
      ),
      displayMedium: GoogleFonts.instrumentSerif(
        fontSize: 48,
        height: .98,
        letterSpacing: -1.4,
        color: text,
      ),
      headlineLarge: GoogleFonts.instrumentSerif(
        fontSize: 36,
        height: 1,
        letterSpacing: -.7,
        color: text,
      ),
      headlineMedium: GoogleFonts.manrope(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        height: 1.1,
        letterSpacing: -.8,
        color: text,
      ),
      titleLarge: GoogleFonts.manrope(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        letterSpacing: -.35,
        color: text,
      ),
      bodyLarge: GoogleFonts.manrope(
        fontSize: 16,
        height: 1.55,
        color: text,
      ),
      bodyMedium: GoogleFonts.manrope(
        fontSize: 14,
        height: 1.5,
        color: text,
      ),
      labelLarge: GoogleFonts.manrope(
        fontSize: 13,
        fontWeight: FontWeight.w700,
        letterSpacing: .2,
        color: text,
      ),
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
