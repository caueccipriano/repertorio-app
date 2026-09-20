import 'package:flutter/material.dart';

import '../../../app/state/app_state_scope.dart';
import '../../../core/widgets/editorial_frame.dart';
import '../../../core/widgets/knowledge_cover.dart';
import '../../../core/widgets/paper_texture.dart';
import '../../article/presentation/article_screen.dart';
import '../../article/presentation/quick_peek.dart';
import '../../search/presentation/search_screen.dart';
import '../../today/data/demo_topics.dart';
import '../../today/domain/knowledge_topic.dart';

enum _SavedFilter { all, reading, completed }

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  _SavedFilter _filter = _SavedFilter.all;

  @override
  Widget build(BuildContext context) {
    final state = AppStateScope.of(context);
    final allSavedTopics = state.savedTopicIds
        .map(topicById)
        .whereType<KnowledgeTopic>()
        .toList();
    final readingCount = allSavedTopics.where((topic) {
      final progress = state.progressFor(topic.id);
      return progress > 0 && progress < .92;
    }).length;
    final completedCount = allSavedTopics
        .where((topic) => state.completedTopicIds.contains(topic.id))
        .length;

    final savedTopics = allSavedTopics.where((topic) {
      switch (_filter) {
        case _SavedFilter.all:
          return true;
        case _SavedFilter.reading:
          final progress = state.progressFor(topic.id);
          return progress > 0 && progress < .92;
        case _SavedFilter.completed:
          return state.completedTopicIds.contains(topic.id);
      }
    }).toList();

    return PaperTexture(
      child: SafeArea(
        bottom: false,
        child: EditorialFrame(
          maxWidth: 860,
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ARQUIVO PESSOAL',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 9,
                      letterSpacing: 1.2,
                    ),
              ),
              const SizedBox(height: 7),
              Row(
                children: [
                  Text(
                    'minha biblioteca',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const Spacer(),
                  IconButton(
                    tooltip: 'Buscar',
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (_) => const SearchScreen(),
                      ),
                    ),
                    icon: const Icon(Icons.search),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Assuntos que você realmente salvou aparecem aqui.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
              const SizedBox(height: 18),
              _LibraryOverview(
                total: allSavedTopics.length,
                reading: readingCount,
                completed: completedCount,
              ),
              const SizedBox(height: 16),
              _SavedTabs(
                selected: _filter,
                onChanged: (value) => setState(() => _filter = value),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: savedTopics.isEmpty
                    ? _EmptyLibrary(filter: _filter)
                    : LayoutBuilder(
                        builder: (context, constraints) {
                          final columns = constraints.maxWidth >= 700
                              ? 4
                              : constraints.maxWidth >= 480
                                  ? 3
                                  : 2;
                          const gap = 14.0;
                          final width =
                              (constraints.maxWidth - gap * (columns - 1)) /
                                  columns;

                          return SingleChildScrollView(
                            child: Wrap(
                              spacing: gap,
                              runSpacing: 22,
                              children: savedTopics
                                  .map(
                                    (topic) => SizedBox(
                                      width: width,
                                      child: _SavedBook(
                                        topic: topic,
                                        width: width,
                                        progress:
                                            state.progressFor(topic.id),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LibraryOverview extends StatelessWidget {
  const _LibraryOverview({
    required this.total,
    required this.reading,
    required this.completed,
  });

  final int total;
  final int reading;
  final int completed;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final stats = [
      (total, 'guardados'),
      (reading, 'lendo'),
      (completed, 'concluídos'),
    ];

    return Container(
      decoration: BoxDecoration(
        color: colors.surface,
        border: Border.all(color: colors.outline),
      ),
      child: Row(
        children: stats.indexed.map((item) {
          return Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              decoration: BoxDecoration(
                border: item.$1 == stats.length - 1
                    ? null
                    : Border(
                        right: BorderSide(color: colors.outline),
                      ),
              ),
              child: Column(
                children: [
                  Text(
                    item.$2.$1.toString().padLeft(2, '0'),
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: colors.primary,
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    item.$2.$2,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: colors.onSurfaceVariant,
                          fontSize: 9,
                        ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _SavedTabs extends StatelessWidget {
  const _SavedTabs({
    required this.selected,
    required this.onChanged,
  });

  final _SavedFilter selected;
  final ValueChanged<_SavedFilter> onChanged;

  @override
  Widget build(BuildContext context) {
    const tabs = [
      (_SavedFilter.all, 'TODOS'),
      (_SavedFilter.reading, 'LENDO'),
      (_SavedFilter.completed, 'CONCLUÍDOS'),
    ];

    return Container(
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.onSurface),
      ),
      child: Row(
        children: tabs.indexed.map((item) {
          final value = item.$2.$1;
          final isSelected = selected == value;

          return Expanded(
            child: InkWell(
              onTap: () => onChanged(value),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isSelected ? Theme.of(context).colorScheme.onSurface : Colors.transparent,
                  border: item.$1 == tabs.length - 1
                      ? null
                      : Border(
                          right: BorderSide(
                            color: Theme.of(context).colorScheme.outline,
                          ),
                        ),
                ),
                child: Text(
                  item.$2.$2,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: isSelected
                            ? Theme.of(context).colorScheme.surface
                            : Theme.of(context).colorScheme.onSurface,
                        fontSize: 9,
                        letterSpacing: .6,
                      ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _EmptyLibrary extends StatelessWidget {
  const _EmptyLibrary({required this.filter});

  final _SavedFilter filter;

  @override
  Widget build(BuildContext context) {
    final title = switch (filter) {
      _SavedFilter.all => 'sua biblioteca começa vazia.',
      _SavedFilter.reading => 'nenhuma leitura em andamento.',
      _SavedFilter.completed => 'nenhum assunto concluído ainda.',
    };

    final body = switch (filter) {
      _SavedFilter.all =>
        'Salve apenas o que realmente quiser guardar. Nada entra aqui automaticamente.',
      _SavedFilter.reading =>
        'Quando você começar um assunto salvo, ele aparece nesta estante.',
      _SavedFilter.completed =>
        'Ao terminar uma leitura salva, ela passa a fazer parte deste arquivo.',
    };

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 460),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            border: Border.all(color: Theme.of(context).colorScheme.onSurface),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.bookmark_border, size: 30),
              const SizedBox(height: 22),
              Text(
                title,
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontSize: 35,
                    ),
              ),
              const SizedBox(height: 12),
              Text(
                body,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              if (filter == _SavedFilter.all) ...[
                const SizedBox(height: 18),
                FilledButton.icon(
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (_) => const SearchScreen(),
                    ),
                  ),
                  icon: const Icon(Icons.search, size: 18),
                  label: const Text('encontrar algo para guardar'),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _SavedBook extends StatelessWidget {
  const _SavedBook({
    required this.topic,
    required this.width,
    required this.progress,
  });

  final KnowledgeTopic topic;
  final double width;
  final double progress;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        KnowledgeCover(
          title: topic.title,
          kicker: topic.tags.join(' · '),
          style: _styleFor(topic.id),
          width: width,
          height: width * 1.3,
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (_) => ArticleScreen(topic: topic),
            ),
          ),
          onLongPress: () => showQuickPeek(context, topic),
        ),
        const SizedBox(height: 9),
        Text(
          topic.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: 14,
              ),
        ),
        const SizedBox(height: 3),
        Text(
          topic.tags.join(' · '),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
                fontSize: 9,
              ),
        ),
        if (progress > 0) ...[
          const SizedBox(height: 7),
          LinearProgressIndicator(
            value: progress,
            minHeight: 4,
            color: Theme.of(context).colorScheme.primary,
            backgroundColor: Theme.of(context).colorScheme.outline,
          ),
          const SizedBox(height: 4),
          Text(
            '${(progress * 100).round()}%',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 9,
                ),
          ),
        ],
      ],
    );
  }

  KnowledgeCoverStyle _styleFor(String id) {
    return switch (id) {
      'bauhaus' => KnowledgeCoverStyle.bauhaus,
      'modernismo' => KnowledgeCoverStyle.archive,
      'fermi' => KnowledgeCoverStyle.constellation,
      'roma' => KnowledgeCoverStyle.stamp,
      'brutalismo' => KnowledgeCoverStyle.archive,
      'helvetica' => KnowledgeCoverStyle.diagonal,
      'inflacao' => KnowledgeCoverStyle.columns,
      'vinho' => KnowledgeCoverStyle.waves,
      _ => KnowledgeCoverStyle.typography,
    };
  }
}
