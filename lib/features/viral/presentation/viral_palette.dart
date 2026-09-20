import 'package:flutter/material.dart';

class ViralPalette {
  const ViralPalette({
    required this.background,
    required this.surface,
    required this.surfaceRaised,
    required this.text,
    required this.muted,
    required this.line,
    required this.accent,
    required this.accentStrong,
    required this.accentSoft,
    required this.onAccent,
    required this.shadow,
  });

  final Color background;
  final Color surface;
  final Color surfaceRaised;
  final Color text;
  final Color muted;
  final Color line;
  final Color accent;
  final Color accentStrong;
  final Color accentSoft;
  final Color onAccent;
  final Color shadow;

  factory ViralPalette.of(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final dark = theme.brightness == Brightness.dark;

    if (dark) {
      return ViralPalette(
        background: theme.scaffoldBackgroundColor,
        surface: scheme.surface,
        surfaceRaised: scheme.surfaceContainerHighest,
        text: scheme.onSurface,
        muted: const Color(0xFFB6B8C2),
        line: const Color(0xFF394152),
        accent: const Color(0xFF91AAFF),
        accentStrong: const Color(0xFFC1CEFF),
        accentSoft: const Color(0xFF202A45),
        onAccent: const Color(0xFF091229),
        shadow: Colors.black.withValues(alpha: .34),
      );
    }

    return ViralPalette(
      background: theme.scaffoldBackgroundColor,
      surface: scheme.surface,
      surfaceRaised: const Color(0xFFF1EEE7),
      text: scheme.onSurface,
      muted: const Color(0xFF6F716F),
      line: const Color(0xFFD2CEC4),
      accent: const Color(0xFF24479F),
      accentStrong: const Color(0xFF17377F),
      accentSoft: const Color(0xFFE3E9F8),
      onAccent: Colors.white,
      shadow: const Color(0x24101010),
    );
  }
}
