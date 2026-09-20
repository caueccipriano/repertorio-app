import 'package:flutter/material.dart';

import '../../../app/state/app_state_scope.dart';
import '../../../core/widgets/editorial_frame.dart';
import '../../../core/widgets/paper_texture.dart';
import '../../article/presentation/article_screen.dart';
import '../../today/domain/knowledge_topic.dart';
import '../../viral/data/viral_score_focus.dart';

class CulturalAreaScreen extends StatelessWidget {
  const CulturalAreaScreen({
    super.key,
    required this.category,
    required this.isStrong,
    required this.isWeak,
  });

  final String category;
  final bool isStrong;
  final bool isWeak;

  @override
  Widget build(BuildContext context) {
    final state = AppStateScope.of(context);
    final allTopics = topicsForScoreCategory(category);
    final exploredIds = <String>{
      ...state.historyTopicIds,
      ...state.completedTopicIds,
    };
    final explored = allTopics
        .where((topic) => exploredIds.contains(topic.id))
        .toList(growable: false);
    final next = allTopics
        .where((topic) => !exploredIds.contains(topic.id))
        .take(3)
        .toList(growable: false);

    return Scaffold(
      appBar: AppBar(title: const Text('área')),
      body: PaperTexture(
        child: SingleChildScrollView(
          child: EditorialFrame(
            maxWidth: 760,
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 44),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'MAPA CULTURAL / ${_label(category).toUpperCase()}',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 9,
                        letterSpacing: 1.05,
                        fontWeight: FontWeight.w900,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  _label(category),
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        fontSize: 54,
                        height: .92,
                      ),
                ),
                const SizedBox(height: 12),
                Text(
                  _description(category),
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                        height: 1.45,
                      ),
                ),
                const SizedBox(height: 18),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    _MetaChip(label: '${explored.length} explorados'),
                    _MetaChip(label: '${allTopics.length} no catálogo'),
                    if (isStrong)
                      const _MetaChip(label: '★ forte no último Score'),
                    if (isWeak)
                      const _MetaChip(label: '↗ reforçar no último Score'),
                  ],
                ),
                const SizedBox(height: 28),
                _AreaProgress(
                  explored: explored.length,
                  total: allTopics.length,
                ),
                const SizedBox(height: 30),
                _SectionTitle(
                  title: 'o que você já tocou',
                  subtitle: explored.isEmpty
                      ? 'ainda não há assuntos explorados aqui'
                      : 'seu repertório já deixou rastros nesta área',
                ),
                const SizedBox(height: 12),
                if (explored.isEmpty)
                  const _EmptyState(
                    text: 'Abra um dos próximos assuntos para começar este ponto do mapa.',
                  )
                else
                  ...explored.take(5).map(
                        (topic) => _TopicRow(
                          topic: topic,
                          trailing: 'visto',
                        ),
                      ),
                const SizedBox(height: 30),
                _SectionTitle(
                  title: '3 próximos assuntos',
                  subtitle: next.isEmpty
                      ? 'você já percorreu tudo que temos nesta área'
                      : 'um caminho simples para fazer este ponto crescer',
                ),
                const SizedBox(height: 12),
                if (next.isEmpty)
                  const _EmptyState(
                    text: 'Seu mapa já está bem preenchido aqui.',
                  )
                else
                  ...next.indexed.map(
                    (entry) => _TopicRow(
                      topic: entry.$2,
                      trailing: '0${entry.$1 + 1}',
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _label(String value) {
    return switch (value) {
      'PSICOLOGIA' => 'Psicologia',
      'HISTÓRIA' => 'História',
      'CIÊNCIA' => 'Ciência',
      'ECONOMIA' => 'Economia',
      'ARTE & DESIGN' => 'Arte & design',
      'TECNOLOGIA' => 'Tecnologia',
      'MUNDO' => 'Mundo',
      'CULTURA' => 'Cultura',
      _ => value,
    };
  }

  String _description(String value) {
    return switch (value) {
      'PSICOLOGIA' =>
        'Comportamento, percepção, memória e as pequenas engrenagens que ajudam a explicar por que fazemos o que fazemos.',
      'HISTÓRIA' =>
        'Processos, impérios, rupturas e ideias que ajudam a entender como o presente foi montado.',
      'CIÊNCIA' =>
        'Perguntas sobre matéria, vida, espaço e os métodos usados para transformar curiosidade em evidência.',
      'ECONOMIA' =>
        'Preços, escolhas, incentivos e sistemas que ajudam a ler melhor dinheiro, mercados e sociedade.',
      'ARTE & DESIGN' =>
        'Movimentos, objetos, linguagem visual e arquitetura para enxergar intenção onde antes parecia só estética.',
      'TECNOLOGIA' =>
        'Infraestrutura digital, internet, computação e ideias que moldam a forma como vivemos e trabalhamos.',
      'MUNDO' =>
        'Geografia, cidades, política e contextos que ajudam a localizar melhor o que acontece ao redor.',
      'CULTURA' =>
        'Livros, cinema, música e repertórios que ajudam a ler referências, narrativas e símbolos.',
      _ => 'Uma área do seu repertório em construção.',
    };
  }
}

class _AreaProgress extends StatelessWidget {
  const _AreaProgress({
    required this.explored,
    required this.total,
  });

  final int explored;
  final int total;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final progress = total == 0 ? 0.0 : explored / total;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: colors.surface,
        border: Border.all(color: colors.outline),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'SEU PONTO NESTA ÁREA',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: colors.primary,
                      fontWeight: FontWeight.w900,
                      letterSpacing: .8,
                    ),
              ),
              const Spacer(),
              Text(
                '$explored/$total',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: LinearProgressIndicator(
              value: progress.clamp(0.0, 1.0),
              minHeight: 8,
            ),
          ),
        ],
      ),
    );
  }
}

class _MetaChip extends StatelessWidget {
  const _MetaChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        color: colors.surface,
        border: Border.all(color: colors.outline),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              fontWeight: FontWeight.w800,
              color: colors.onSurfaceVariant,
            ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontSize: 28,
              ),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
        ),
      ],
    );
  }
}

class _TopicRow extends StatelessWidget {
  const _TopicRow({
    required this.topic,
    required this.trailing,
  });

  final KnowledgeTopic topic;
  final String trailing;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return InkWell(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (_) => ArticleScreen(topic: topic),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 13),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: colors.outline),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    topic.eyebrow,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: colors.primary,
                          fontSize: 8.5,
                          fontWeight: FontWeight.w900,
                          letterSpacing: .7,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    topic.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w900,
                          height: 1.1,
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Text(
              trailing,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: colors.onSurfaceVariant,
                    fontWeight: FontWeight.w800,
                  ),
            ),
            const SizedBox(width: 6),
            const Icon(Icons.arrow_outward_rounded, size: 16),
          ],
        ),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
    );
  }
}
