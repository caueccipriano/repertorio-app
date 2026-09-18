import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../../core/widgets/editorial_frame.dart';
import '../../../core/widgets/knowledge_cover.dart';
import '../../../core/widgets/paper_texture.dart';
import '../../article/presentation/article_screen.dart';
import '../../article/presentation/quick_peek.dart';
import '../../search/presentation/search_screen.dart';
import '../../today/data/demo_topics.dart';
import '../../today/domain/knowledge_topic.dart';

class TopicCollectionScreen extends StatelessWidget {
  const TopicCollectionScreen({
    super.key,
    required this.title,
    required this.subtitle,
    required this.topicIds,
  });

  final String title;
  final String subtitle;
  final List<String> topicIds;

  @override
  Widget build(BuildContext context) {
    final topics = topicIds
        .map(topicById)
        .whereType<KnowledgeTopic>()
        .toList(growable: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('coleção'),
        actions: [
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
      body: PaperTexture(
        child: SingleChildScrollView(
          child: EditorialFrame(
            maxWidth: 860,
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 44),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        fontSize: 58,
                        height: .94,
                      ),
                ),
                const SizedBox(height: 12),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 620),
                  child: Text(
                    subtitle,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                          fontSize: 17,
                        ),
                  ),
                ),
                const SizedBox(height: 24),
                _CollectionMeta(count: topics.length),
                const SizedBox(height: 30),
                if (topics.isEmpty)
                  const _EmptyCollection()
                else
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final columns = constraints.maxWidth >= 720
                          ? 4
                          : constraints.maxWidth >= 500
                              ? 3
                              : 2;
                      const gap = 16.0;
                      final width =
                          (constraints.maxWidth - gap * (columns - 1)) /
                              columns;

                      return Wrap(
                        spacing: gap,
                        runSpacing: 28,
                        children: topics.indexed
                            .map(
                              (item) => _TopicTile(
                                topic: item.$2,
                                width: width,
                                style: _styleFor(item.$2, item.$1),
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

  KnowledgeCoverStyle _styleFor(KnowledgeTopic topic, int index) {
    switch (topic.id) {
      case 'bauhaus':
        return KnowledgeCoverStyle.bauhaus;
      case 'modernismo':
        return KnowledgeCoverStyle.archive;
      case 'fermi':
        return KnowledgeCoverStyle.orbit;
      case 'roma':
        return KnowledgeCoverStyle.columns;
      case 'brutalismo':
        return KnowledgeCoverStyle.archive;
      case 'helvetica':
        return KnowledgeCoverStyle.typography;
      case 'inflacao':
        return KnowledgeCoverStyle.columns;
      case 'vinho':
        return KnowledgeCoverStyle.waves;
      default:
        const styles = KnowledgeCoverStyle.values;
        return styles[index % styles.length];
    }
  }
}

class _CollectionMeta extends StatelessWidget {
  const _CollectionMeta({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.onSurface),
      ),
      child: Row(
        children: [
          Expanded(
            child: Center(
              child: Text(
                '$count ASSUNTOS',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontSize: 9,
                      letterSpacing: .7,
                    ),
              ),
            ),
          ),
          const VerticalDivider(width: 1, color: Theme.of(context).colorScheme.onSurface),
          Expanded(
            child: Center(
              child: Text(
                'LEITURA CURTA',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontSize: 9,
                      letterSpacing: .7,
                    ),
              ),
            ),
          ),
          const VerticalDivider(width: 1, color: Theme.of(context).colorScheme.onSurface),
          Expanded(
            child: Center(
              child: Text(
                'CONECTADA',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontSize: 9,
                      letterSpacing: .7,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TopicTile extends StatelessWidget {
  const _TopicTile({
    required this.topic,
    required this.width,
    required this.style,
  });

  final KnowledgeTopic topic;
  final double width;
  final KnowledgeCoverStyle style;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          KnowledgeCover(
            title: topic.title,
            kicker: topic.tags.join(' · '),
            style: style,
            width: width,
            height: width * 1.35,
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (_) => ArticleScreen(topic: topic),
              ),
            ),
            onLongPress: () => showQuickPeek(context, topic),
          ),
          const SizedBox(height: 10),
          Text(
            topic.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 14,
                  height: 1.08,
                ),
          ),
          const SizedBox(height: 4),
          Text(
            '${topic.minutes} min · ${topic.tags.first}',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                  fontSize: 9,
                ),
          ),
        ],
      ),
    );
  }
}

class _EmptyCollection extends StatelessWidget {
  const _EmptyCollection();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border.all(color: Theme.of(context).colorScheme.onSurface),
      ),
      child: Text(
        'Esta estante ainda está sendo montada.',
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
