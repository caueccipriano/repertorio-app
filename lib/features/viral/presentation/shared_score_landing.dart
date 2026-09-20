import 'package:flutter/material.dart';

import 'viral_palette.dart';
import '../../../core/widgets/paper_texture.dart';

class SharedScoreLanding extends StatelessWidget {
  const SharedScoreLanding({
    super.key,
    required this.score,
    required this.onStart,
    required this.onEnterApp,
  });

  final int score;
  final VoidCallback onStart;
  final VoidCallback onEnterApp;

  String get archetype {
    if (score >= 775) return 'ENCICLOPÉDIA AMBULANTE';
    if (score >= 665) return 'CABEÇA DE WIKIPEDIA';
    if (score >= 555) return 'CURIOSO CAÓTICO';
    return 'RADAR LIGADO';
  }

  String get description {
    if (score >= 775) {
      return 'Esse resultado indica um repertório amplo neste teste rápido.';
    }
    if (score >= 665) {
      return 'Esse resultado mostra uma boa base de cultura geral neste teste.';
    }
    if (score >= 555) {
      return 'Esse resultado mistura boas referências com espaço para novas conexões.';
    }
    return 'Esse resultado é só o começo: um assunto por dia já muda bastante o placar.';
  }

  @override
  Widget build(BuildContext context) {
    final palette = ViralPalette.of(context);
    final textTheme = Theme.of(context).textTheme;

    return PaperTexture(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 18, 20, 34),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 760),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Row(
                      children: [
                        Text(
                          'repertório*',
                          style: TextStyle(
                            color: palette.accent,
                            fontSize: 21,
                            fontWeight: FontWeight.w900,
                            letterSpacing: -.9,
                          ),
                        ),
                        Spacer(),
                        Text('SCORE COMPARTILHADO'),
                      ],
                    ),
                    const SizedBox(height: 46),
                    Text(
                      'ALGUÉM TE MANDOU\nO SCORE DELE.',
                      style: textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w900,
                        letterSpacing: -1.4,
                        height: .94,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Agora vem a parte importante: descobrir o seu.',
                      style: textTheme.bodyLarge?.copyWith(
                        color: palette.muted,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 32),
                    Container(
                      padding: const EdgeInsets.fromLTRB(24, 24, 24, 28),
                      decoration: BoxDecoration(
                        color: palette.surface,
                        border: Border.all(color: palette.line, width: 1.2),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x22101010),
                            offset: Offset(8, 8),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'REPERTÓRIO SCORE',
                            style: textTheme.labelMedium?.copyWith(
                              color: palette.accent,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 1.4,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            '$score',
                            style: textTheme.displayLarge?.copyWith(
                              color: palette.accent,
                              fontSize: 96,
                              height: .88,
                              letterSpacing: -6,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            archetype,
                            style: textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.w900,
                              letterSpacing: -1,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            description,
                            style: textTheme.bodyLarge?.copyWith(height: 1.45),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    FilledButton.icon(
                      onPressed: onStart,
                      style: FilledButton.styleFrom(
                        backgroundColor: palette.accent,
                        foregroundColor: palette.onAccent,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 22,
                          vertical: 18,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      icon: const Icon(Icons.bolt_rounded),
                      label: const Text(
                        'FAZER MEU SCORE',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          letterSpacing: .5,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    OutlinedButton(
                      onPressed: onEnterApp,
                      style: OutlinedButton.styleFrom(
                        foregroundColor: palette.text,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 22,
                          vertical: 18,
                        ),
                        side: BorderSide(
                          color: palette.line,
                          width: 1.2,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'CONHECER O REPERTÓRIO',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          letterSpacing: .35,
                        ),
                      ),
                    ),
                    const SizedBox(height: 38),
                    const _ProductPreview(),
                    const SizedBox(height: 26),
                    Text(
                      'Score experimental baseado em 8 perguntas. Ele não mede inteligência e não representa uma avaliação científica.',
                      textAlign: TextAlign.center,
                      style: textTheme.bodySmall?.copyWith(
                        color: palette.muted,
                        height: 1.35,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ProductPreview extends StatelessWidget {
  const _ProductPreview();

  @override
  Widget build(BuildContext context) {
    final palette = ViralPalette.of(context);
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: palette.accentSoft.withValues(alpha: .72),
        border: Border.all(color: palette.accent.withValues(alpha: .42)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'DEPOIS DO TESTE',
            style: textTheme.labelSmall?.copyWith(
              color: palette.accentStrong,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.3,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'aumente seu repertório, não só seu score.',
            style: textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w900,
              letterSpacing: -.7,
            ),
          ),
          const SizedBox(height: 16),
          const Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              _FeaturePill('1 assunto por dia'),
              _FeaturePill('quiz'),
              _FeaturePill('podcasts'),
              _FeaturePill('progresso'),
              _FeaturePill('coleções'),
              _FeaturePill('revisões'),
            ],
          ),
          const SizedBox(height: 18),
          Text(
            'FREE para começar · REPERTÓRIO+ para ir mais fundo',
            style: textTheme.bodySmall?.copyWith(
              color: palette.accentStrong,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}

class _FeaturePill extends StatelessWidget {
  const _FeaturePill(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    final palette = ViralPalette.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 7),
      decoration: BoxDecoration(
        color: palette.surface,
        border: Border.all(color: palette.line),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
