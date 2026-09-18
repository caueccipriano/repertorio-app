import 'package:flutter/material.dart';

import '../../../app/state/app_state.dart';
import '../../../app/state/app_state_scope.dart';
import '../../../app/theme/app_colors.dart';

class AppearanceScreen extends StatelessWidget {
  const AppearanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = AppStateScope.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('aparência')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(18, 18, 18, 36),
          children: [
            Text(
              'escolha o clima.',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 8),
            Text(
              'O tema do app é independente do tema do leitor. Você pode usar o Repertório escuro e continuar lendo em papel, sépia ou escuro.',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
            const SizedBox(height: 26),
            _AppearanceOption(
              title: 'claro',
              subtitle: 'papel, creme e azul cobalto',
              mode: AppAppearance.light,
              selected: state.appAppearance == AppAppearance.light,
              preview: const _LightPreview(),
              onTap: () => state.updateAppearance(AppAppearance.light),
            ),
            const SizedBox(height: 14),
            _AppearanceOption(
              title: 'escuro',
              subtitle: 'preto azulado, creme e azul luminoso',
              mode: AppAppearance.dark,
              selected: state.appAppearance == AppAppearance.dark,
              preview: const _DarkPreview(),
              onTap: () => state.updateAppearance(AppAppearance.dark),
            ),
          ],
        ),
      ),
    );
  }
}

class _AppearanceOption extends StatelessWidget {
  const _AppearanceOption({
    required this.title,
    required this.subtitle,
    required this.mode,
    required this.selected,
    required this.preview,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final AppAppearance mode;
  final bool selected;
  final Widget preview;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Material(
      color: colors.surface,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            border: Border.all(
              color: selected ? colors.primary : colors.outline,
              width: selected ? 2 : 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              preview,
              const SizedBox(height: 14),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontSize: 16),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          subtitle,
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: colors.onSurfaceVariant,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  Radio<AppAppearance>(
                    value: mode,
                    groupValue: selected ? mode : null,
                    onChanged: (_) => onTap(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LightPreview extends StatelessWidget {
  const _LightPreview();

  @override
  Widget build(BuildContext context) {
    return const _Preview(
      background: AppColors.paper,
      surface: AppColors.paperWhite,
      text: AppColors.ink,
      accent: AppColors.blue,
    );
  }
}

class _DarkPreview extends StatelessWidget {
  const _DarkPreview();

  @override
  Widget build(BuildContext context) {
    return const _Preview(
      background: Color(0xFF101116),
      surface: Color(0xFF191B22),
      text: Color(0xFFF5F2EA),
      accent: Color(0xFF7595EF),
    );
  }
}

class _Preview extends StatelessWidget {
  const _Preview({
    required this.background,
    required this.surface,
    required this.text,
    required this.accent,
  });

  final Color background;
  final Color surface;
  final Color text;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 126,
      decoration: BoxDecoration(
        color: background,
        border: Border.all(color: text.withValues(alpha: .25)),
      ),
      padding: const EdgeInsets.all(13),
      child: Row(
        children: [
          Container(
            width: 72,
            decoration: BoxDecoration(
              color: surface,
              border: Border.all(color: accent),
            ),
            child: Center(
              child: Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  color: accent,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(height: 10, width: 72, color: accent),
                const SizedBox(height: 12),
                Container(height: 7, color: text),
                const SizedBox(height: 7),
                Container(
                  height: 7,
                  width: 110,
                  color: text.withValues(alpha: .55),
                ),
                const Spacer(),
                Container(
                  height: 18,
                  width: 62,
                  decoration: BoxDecoration(
                    border: Border.all(color: text.withValues(alpha: .6)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
