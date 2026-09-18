import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../article/presentation/article_screen.dart';
import '../../today/data/demo_topics.dart';
import '../../today/domain/knowledge_topic.dart';
import '../data/study_content.dart';

class EntitiesScreen extends StatelessWidget {
  const EntitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('pessoas · obras · lugares')),
      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.fromLTRB(16, 14, 16, 34),
          itemCount: knowledgeEntities.length,
          separatorBuilder: (_, __) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            final entity = knowledgeEntities[index];
            return _EntityCard(entity: entity);
          },
        ),
      ),
    );
  }
}

class _EntityCard extends StatelessWidget {
  const _EntityCard({required this.entity});

  final KnowledgeEntity entity;

  @override
  Widget build(BuildContext context) {
    final topics = entity.topicIds
        .map(topicById)
        .whereType<KnowledgeTopic>()
        .toList();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.paperWhite,
        border: Border.all(color: AppColors.ink),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _EntityIcon(type: entity.type),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  entity.subtitle.toUpperCase(),
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: AppColors.blue,
                        fontSize: 9,
                        letterSpacing: .9,
                      ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            entity.name,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontSize: 30,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            entity.summary,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.muted,
                ),
          ),
          if (topics.isNotEmpty) ...[
            const SizedBox(height: 14),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: topics
                  .map(
                    (topic) => ActionChip(
                      label: Text(topic.tags.first),
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (_) => ArticleScreen(topic: topic),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ],
      ),
    );
  }
}

class _EntityIcon extends StatelessWidget {
  const _EntityIcon({required this.type});

  final KnowledgeEntityType type;

  @override
  Widget build(BuildContext context) {
    final icon = switch (type) {
      KnowledgeEntityType.person => Icons.person_outline,
      KnowledgeEntityType.place => Icons.place_outlined,
      KnowledgeEntityType.work => Icons.image_outlined,
      KnowledgeEntityType.concept => Icons.lightbulb_outline,
    };

    return Icon(icon, size: 20);
  }
}
