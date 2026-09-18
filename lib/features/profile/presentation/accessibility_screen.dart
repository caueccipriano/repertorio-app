import 'package:flutter/material.dart';

import '../../../app/state/app_state_scope.dart';
import '../../../app/theme/app_colors.dart';

class AccessibilityScreen extends StatelessWidget {
  const AccessibilityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = AppStateScope.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('acessibilidade')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(18, 16, 18, 36),
          children: [
            Text(
              'leitura do seu jeito.',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 10),
            Text(
              'Essas opções ficam salvas neste aparelho e também entram no backup.',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
            const SizedBox(height: 24),
            _Toggle(
              title: 'Contraste reforçado',
              subtitle:
                  'Aumenta a diferença entre texto, fundo e controles.',
              value: state.highContrast,
              onChanged: (value) =>
                  state.updateAccessibility(contrast: value),
            ),
            _Toggle(
              title: 'Reduzir movimento',
              subtitle:
                  'Evita transições e animações desnecessárias.',
              value: state.reduceMotion,
              onChanged: (value) =>
                  state.updateAccessibility(motion: value),
            ),
            _Toggle(
              title: 'Áreas de toque maiores',
              subtitle:
                  'Facilita botões e ações em telas menores.',
              value: state.largeTapTargets,
              onChanged: (value) =>
                  state.updateAccessibility(targets: value),
            ),
          ],
        ),
      ),
    );
  }
}

class _Toggle extends StatelessWidget {
  const _Toggle({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border.all(color: Theme.of(context).colorScheme.outline),
      ),
      child: SwitchListTile.adaptive(
        title: Text(title),
        subtitle: Text(subtitle),
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}
