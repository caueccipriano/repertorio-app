import 'package:flutter/material.dart';

import '../../../app/state/app_state.dart';
import '../../../app/state/app_state_scope.dart';
import 'viral_palette.dart';

class ViralThemeToggle extends StatelessWidget {
  const ViralThemeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    final state = AppStateScope.of(context);
    final palette = ViralPalette.of(context);
    final dark = state.appAppearance == AppAppearance.dark;

    return IconButton(
      tooltip: dark ? 'Usar modo claro' : 'Usar modo escuro',
      onPressed: () {
        state.updateAppearance(
          dark ? AppAppearance.light : AppAppearance.dark,
        );
      },
      style: IconButton.styleFrom(
        foregroundColor: palette.text,
        backgroundColor: palette.surface,
        side: BorderSide(color: palette.line),
        minimumSize: const Size(44, 44),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      icon: Icon(
        dark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
        size: 19,
      ),
    );
  }
}
