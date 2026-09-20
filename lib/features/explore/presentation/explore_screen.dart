import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../../core/widgets/editorial_frame.dart';
import '../../../core/widgets/knowledge_cover.dart';
import '../../../core/widgets/paper_texture.dart';
import '../../search/presentation/search_screen.dart';
import '../../today/data/demo_topics.dart';
import 'topic_collection_screen.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  static const _trails = [
    _TrailEntry(
      title: '50 coisas que vale saber',
      subtitle: 'Uma base cultural para conversar melhor sobre o mundo.',
      topicIds: ['bauhaus', 'fermi', 'roma', 'inflacao', 'vinho'],
    ),
    _TrailEntry(
      title: 'Entenda design sem decorar nomes',
      subtitle: 'Bauhaus, tipografia, modernismo e brutalismo em sequência.',
      topicIds: ['bauhaus', 'helvetica', 'modernismo', 'brutalismo'],
    ),
    _TrailEntry(
      title: 'Economia para ler o jornal',
      subtitle: 'Comece pelos conceitos que aparecem o tempo todo.',
      topicIds: ['inflacao', 'roma', 'fermi'],
    ),
  ];

  static const _catalog = [
    _CatalogEntry(
      title: 'História',
      subtitle: 'Impérios, revoluções e ideias',
      style: KnowledgeCoverStyle.columns,
      tags: ['história', 'geopolítica'],
    ),
    _CatalogEntry(
      title: 'Ciência',
      subtitle: 'Do átomo ao universo',
      style: KnowledgeCoverStyle.orbit,
      tags: ['ciência', 'astronomia'],
    ),
    _CatalogEntry(
      title: 'Arte',
      subtitle: 'Movimentos, obras e contexto',
      style: KnowledgeCoverStyle.waves,
      tags: ['arte', 'fotografia'],
    ),
    _CatalogEntry(
      title: 'Design',
      subtitle: 'Objetos, sistemas e linguagem',
      style: KnowledgeCoverStyle.bauhaus,
      tags: ['design', 'tipografia', 'moda'],
    ),
    _CatalogEntry(
      title: 'Arquitetura',
      subtitle: 'Espaços que contam histórias',
      style: KnowledgeCoverStyle.archive,
      tags: ['arquitetura', 'cidade'],
    ),
    _CatalogEntry(
      title: 'Filosofia',
      subtitle: 'Perguntas que mudaram o mundo',
      style: KnowledgeCoverStyle.typography,
      tags: ['filosofia'],
    ),
    _CatalogEntry(
      title: 'Psicologia',
      subtitle: 'Mente, comportamento e escolhas',
      style: KnowledgeCoverStyle.waves,
      tags: ['psicologia'],
    ),
    _CatalogEntry(
      title: 'Economia',
      subtitle: 'Dinheiro, mercados e sociedade',
      style: KnowledgeCoverStyle.columns,
      tags: ['economia', 'finanças', 'contabilidade'],
    ),
    _CatalogEntry(
      title: 'Tecnologia',
      subtitle: 'Ideias que viraram infraestrutura',
      style: KnowledgeCoverStyle.typography,
      tags: ['tecnologia', 'computação'],
    ),
    _CatalogEntry(
      title: 'Cinema',
      subtitle: 'Filmes, linguagem e bastidores',
      style: KnowledgeCoverStyle.archive,
      tags: ['cinema'],
    ),
    _CatalogEntry(
      title: 'Música',
      subtitle: 'Gêneros, movimentos e histórias',
      style: KnowledgeCoverStyle.waves,
      tags: ['música'],
    ),
    _CatalogEntry(
      title: 'Mundo',
      subtitle: 'Geografia, cultura e sociedade',
      style: KnowledgeCoverStyle.orbit,
      tags: ['geografia', 'cultura', 'brasil', 'geopolítica'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PaperTexture(
      child: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: EditorialFrame(
            maxWidth: 860,
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'DESCOBERTA / CATÁLOGO',
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
                      'catálogo',
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
                  'Navegue como numa biblioteca. Cada tema abre uma estante de assuntos conectados.',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                ),
                const SizedBox(height: 22),
                const _TrailRail(trails: _trails),
                const SizedBox(height: 30),
                _CatalogHeader(
                  areaCount: _catalog.length,
                  topicCount: allDemoTopics.length,
                ),
                const SizedBox(height: 18),
                LayoutBuilder(
                  builder: (context, constraints) {
                    final columns = constraints.maxWidth >= 720
                        ? 4
                        : constraints.maxWidth >= 500
                            ? 3
                            : 2;
                    const gap = 14.0;
                    final width =
                        (constraints.maxWidth - gap * (columns - 1)) / columns;

                    return Wrap(
                      spacing: gap,
                      runSpacing: 22,
                      children: _catalog
                          .map(
                            (entry) => _CatalogCard(
                              entry: entry,
                              width: width,
                            ),
                          )
                          .toList(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TrailRail extends StatelessWidget {
  const _TrailRail({required this.trails});

  final List<_TrailEntry> trails;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'trilhas editoriais',
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontSize: 29,
              ),
        ),
        const SizedBox(height: 5),
        Text(
          'Sequências curtas para estudar com contexto.',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
        ),
        const SizedBox(height: 14),
        SizedBox(
          height: 154,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: trails.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final trail = trails[index];
              return SizedBox(
                width: 250,
                child: Material(
                  color: index.isEven
                      ? AppColors.deepBlue
                      : Theme.of(context).colorScheme.surface,
                  child: InkWell(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (_) => TopicCollectionScreen(
                          title: trail.title,
                          subtitle: trail.subtitle,
                          topicIds: trail.topicIds,
                        ),
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        border: Border.all(color: Theme.of(context).colorScheme.onSurface),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'TRILHA · ${trail.topicIds.length} ASSUNTOS',
                            style:
                                Theme.of(context).textTheme.labelLarge?.copyWith(
                                      color: index.isEven
                                          ? Colors.white60
                                          : Theme.of(context).colorScheme.primary,
                                      fontSize: 9,
                                      letterSpacing: 1,
                                    ),
                          ),
                          const Spacer(),
                          Text(
                            trail.title,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(
                                  color: index.isEven
                                      ? Colors.white
                                      : Theme.of(context).colorScheme.onSurface,
                                  fontSize: 23,
                                  height: 1.02,
                                ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Text(
                                'começar',
                                style: TextStyle(
                                  color: index.isEven
                                      ? Colors.white70
                                      : Theme.of(context).colorScheme.onSurfaceVariant,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const Spacer(),
                              Icon(
                                Icons.arrow_forward,
                                color: index.isEven
                                    ? Colors.white
                                    : Theme.of(context).colorScheme.onSurface,
                                size: 18,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _TrailEntry {
  const _TrailEntry({
    required this.title,
    required this.subtitle,
    required this.topicIds,
  });

  final String title;
  final String subtitle;
  final List<String> topicIds;
}

class _CatalogHeader extends StatelessWidget {
  const _CatalogHeader({
    required this.areaCount,
    required this.topicCount,
  });

  final int areaCount;
  final int topicCount;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'explore por área',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontSize: 29,
                    ),
              ),
              const SizedBox(height: 5),
              Text(
                '$areaCount estantes · $topicCount assuntos no acervo.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: colors.onSurfaceVariant,
                    ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Material(
          color: colors.surface,
          child: InkWell(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (_) => const SearchScreen(),
              ),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
              decoration: BoxDecoration(
                border: Border.all(color: colors.outline),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.search, size: 17, color: colors.primary),
                  const SizedBox(width: 7),
                  Text(
                    'BUSCAR',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: colors.primary,
                          fontSize: 9,
                          letterSpacing: .7,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _CatalogCard extends StatelessWidget {
  const _CatalogCard({
    required this.entry,
    required this.width,
  });

  final _CatalogEntry entry;
  final double width;

  @override
  Widget build(BuildContext context) {
    final coverHeight = width * 1.28;
    final topicIds = allDemoTopics
        .where(
          (topic) => topic.tags.any(
            (tag) => entry.tags.contains(tag.toLowerCase()),
          ),
        )
        .map((topic) => topic.id)
        .toSet()
        .toList();

    void openCollection() {
      Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (_) => TopicCollectionScreen(
            title: entry.title,
            subtitle: entry.subtitle,
            topicIds: topicIds,
          ),
        ),
      );
    }

    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          KnowledgeCover(
            title: entry.title,
            kicker: '${topicIds.length} assuntos',
            style: entry.style,
            width: width,
            height: coverHeight,
            onTap: openCollection,
          ),
          const SizedBox(height: 9),
          InkWell(
            onTap: openCollection,
            child: Text(
              entry.title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 15,
                  ),
            ),
          ),
          const SizedBox(height: 3),
          Text(
            entry.subtitle,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 11,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                  height: 1.3,
                ),
          ),
        ],
      ),
    );
  }
}

class _CatalogEntry {
  const _CatalogEntry({
    required this.title,
    required this.subtitle,
    required this.style,
    required this.tags,
  });

  final String title;
  final String subtitle;
  final KnowledgeCoverStyle style;
  final List<String> tags;
}
