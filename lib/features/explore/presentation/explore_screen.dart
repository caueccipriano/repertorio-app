import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../../core/widgets/editorial_frame.dart';
import '../../../core/widgets/knowledge_cover.dart';
import '../../../core/widgets/paper_texture.dart';
import '../../search/presentation/search_screen.dart';
import 'topic_collection_screen.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  static const _catalog = [
    _CatalogEntry(
      title: 'História',
      subtitle: 'Impérios, revoluções e ideias',
      style: KnowledgeCoverStyle.columns,
      topicIds: ['roma', 'bauhaus', 'modernismo'],
    ),
    _CatalogEntry(
      title: 'Ciência',
      subtitle: 'Do átomo ao universo',
      style: KnowledgeCoverStyle.orbit,
      topicIds: ['fermi', 'vinho'],
    ),
    _CatalogEntry(
      title: 'Arte',
      subtitle: 'Movimentos, obras e contexto',
      style: KnowledgeCoverStyle.waves,
      topicIds: ['bauhaus', 'modernismo', 'helvetica'],
    ),
    _CatalogEntry(
      title: 'Design',
      subtitle: 'Objetos, sistemas e linguagem',
      style: KnowledgeCoverStyle.bauhaus,
      topicIds: ['bauhaus', 'helvetica', 'modernismo'],
    ),
    _CatalogEntry(
      title: 'Arquitetura',
      subtitle: 'Espaços que contam histórias',
      style: KnowledgeCoverStyle.archive,
      topicIds: ['modernismo', 'brutalismo', 'bauhaus'],
    ),
    _CatalogEntry(
      title: 'Filosofia',
      subtitle: 'Perguntas que mudaram o mundo',
      style: KnowledgeCoverStyle.typography,
      topicIds: ['fermi', 'roma'],
    ),
    _CatalogEntry(
      title: 'Psicologia',
      subtitle: 'Mente, comportamento e escolhas',
      style: KnowledgeCoverStyle.waves,
      topicIds: ['inflacao', 'fermi'],
    ),
    _CatalogEntry(
      title: 'Economia',
      subtitle: 'Dinheiro, mercados e sociedade',
      style: KnowledgeCoverStyle.columns,
      topicIds: ['inflacao', 'roma'],
    ),
    _CatalogEntry(
      title: 'Tecnologia',
      subtitle: 'Ideias que viraram infraestrutura',
      style: KnowledgeCoverStyle.typography,
      topicIds: ['helvetica', 'fermi', 'bauhaus'],
    ),
    _CatalogEntry(
      title: 'Cinema',
      subtitle: 'Filmes, linguagem e bastidores',
      style: KnowledgeCoverStyle.archive,
      topicIds: ['modernismo', 'helvetica'],
    ),
    _CatalogEntry(
      title: 'Música',
      subtitle: 'Gêneros, movimentos e histórias',
      style: KnowledgeCoverStyle.waves,
      topicIds: ['helvetica', 'bauhaus'],
    ),
    _CatalogEntry(
      title: 'Mundo',
      subtitle: 'Geografia, cultura e sociedade',
      style: KnowledgeCoverStyle.orbit,
      topicIds: ['roma', 'inflacao', 'fermi', 'vinho'],
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
                        color: AppColors.muted,
                      ),
                ),
                const SizedBox(height: 22),
                const _FilterRail(),
                const SizedBox(height: 26),
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

class _FilterRail extends StatelessWidget {
  const _FilterRail();

  @override
  Widget build(BuildContext context) {
    const filters = ['TODOS', 'POPULAR', 'NOVOS', 'RÁPIDOS'];

    return SizedBox(
      height: 38,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final selected = index == 0;

          return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 14),
            decoration: BoxDecoration(
              color: selected ? AppColors.ink : AppColors.paperWhite,
              border: Border.all(color: AppColors.ink),
            ),
            child: Text(
              filters[index],
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: selected ? AppColors.paperWhite : AppColors.ink,
                    fontSize: 9,
                    letterSpacing: .7,
                  ),
            ),
          );
        },
      ),
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

    void openCollection() {
      Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (_) => TopicCollectionScreen(
            title: entry.title,
            subtitle: entry.subtitle,
            topicIds: entry.topicIds,
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
            kicker: '${entry.topicIds.length} assuntos',
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
                  color: AppColors.muted,
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
    required this.topicIds,
  });

  final String title;
  final String subtitle;
  final KnowledgeCoverStyle style;
  final List<String> topicIds;
}
