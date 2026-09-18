import 'package:flutter/material.dart';

import '../../../app/state/app_state.dart';
import '../../../app/state/app_state_scope.dart';
import '../../article/presentation/article_screen.dart';
import '../../today/data/demo_topics.dart';
import '../../today/domain/knowledge_topic.dart';

class MasteryScreen extends StatelessWidget {
  const MasteryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = AppStateScope.of(context);
    final ids = {
      ...state.historyTopicIds,
      ...state.progressByTopic.keys,
      ...state.completedTopicIds,
    };
    final topics = ids.map(topicById).whereType<KnowledgeTopic>().toList()
      ..sort(
        (a, b) =>
            state.masteryScore(b.id).compareTo(state.masteryScore(a.id)),
      );

    return Scaffold(
      appBar: AppBar(title: const Text('domínio')),
      body: SafeArea(
        child: topics.isEmpty
            ? const _EmptyMastery()
            : ListView.separated(
                padding: const EdgeInsets.fromLTRB(16, 14, 16, 34),
                itemCount: topics.length,
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  final topic = topics[index];
                  return _MasteryCard(topic: topic);
                },
              ),
      ),
    );
  }
}

class _MasteryCard extends StatelessWidget {
  const _MasteryCard({required this.topic});

  final KnowledgeTopic topic;

  @override
  Widget build(BuildContext context) {
    final state = AppStateScope.of(context);
    final score = state.masteryScore(topic.id);
    final level = state.masteryLevel(topic.id);
    final colors = Theme.of(context).colorScheme;

    return Material(
      color: colors.surface,
      child: InkWell(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (_) => ArticleScreen(topic: topic),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: colors.outline),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      topic.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontSize: 15,
                          ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  _LevelPill(level: level),
                ],
              ),
              const SizedBox(height: 12),
              LinearProgressIndicator(
                value: score,
                minHeight: 6,
                color: colors.primary,
                backgroundColor: colors.surfaceContainerHighest,
              ),
              const SizedBox(height: 9),
              Wrap(
                spacing: 10,
                runSpacing: 6,
                children: [
                  _Meta(
                    '${(state.progressFor(topic.id) * 100).round()}% lido',
                  ),
                  if (state.quizPercentFor(topic.id) case final quiz?)
                    _Meta('${(quiz * 100).round()}% quiz'),
                  _Meta(
                    '${state.reviewLevelByTopic[topic.id] ?? 0} revisões',
                  ),
                  if (state.explanationFor(topic.id).isNotEmpty)
                    const _Meta('explicou'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LevelPill extends StatelessWidget {
  const _LevelPill({required this.level});

  final MasteryLevel level;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final label = switch (level) {
      MasteryLevel.newTopic => 'NOVO',
      MasteryLevel.familiar => 'FAMILIAR',
      MasteryLevel.understood => 'ENTENDIDO',
      MasteryLevel.consolidated => 'CONSOLIDADO',
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        color: level == MasteryLevel.consolidated
            ? colors.primary
            : colors.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(99),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: level == MasteryLevel.consolidated
                  ? colors.onPrimary
                  : colors.onSurface,
              fontSize: 8,
              letterSpacing: .7,
            ),
      ),
    );
  }
}

class _Meta extends StatelessWidget {
  const _Meta(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            fontSize: 9,
          ),
    );
  }
}

class _EmptyMastery extends StatelessWidget {
  const _EmptyMastery();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(26),
        child: Text(
          'Seu índice de domínio aparece quando você começar a ler, fazer quizzes e revisar.',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
