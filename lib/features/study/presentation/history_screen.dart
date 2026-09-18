import 'package:flutter/material.dart';

import '../../../app/state/app_state_scope.dart';
import '../../article/presentation/article_screen.dart';
import '../../today/data/demo_topics.dart';
import '../../today/domain/knowledge_topic.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = AppStateScope.of(context);
    final topics = state.historyTopicIds
        .map(topicById)
        .whereType<KnowledgeTopic>()
        .toList();

    return Scaffold(
      appBar: AppBar(title: const Text('histórico')),
      body: SafeArea(
        child: topics.isEmpty
            ? const Center(child: Text('Nenhuma leitura ainda.'))
            : ListView.separated(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
                itemCount: topics.length,
                separatorBuilder: (_, __) => Divider(
                  height: 1,
                  color: Theme.of(context).colorScheme.outline,
                ),
                itemBuilder: (context, index) {
                  final topic = topics[index];
                  final opened = state.lastOpenedByTopic[topic.id];
                  final progress = state.progressFor(topic.id);

                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 4,
                      vertical: 8,
                    ),
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
                      foregroundColor: Theme.of(context).colorScheme.primary,
                      child: Text(
                        '${(progress * 100).round()}',
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    title: Text(topic.title),
                    subtitle: Text(
                      opened == null
                          ? topic.tags.join(' · ')
                          : '${_dayLabel(opened)} · ${topic.tags.join(' · ')}',
                    ),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (_) => ArticleScreen(topic: topic),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }

  static String _dayLabel(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final day = DateTime(date.year, date.month, date.day);
    final difference = today.difference(day).inDays;

    if (difference == 0) {
      return 'hoje';
    }
    if (difference == 1) {
      return 'ontem';
    }
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}';
  }
}
