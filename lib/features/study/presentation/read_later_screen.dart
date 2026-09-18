import 'package:flutter/material.dart';

import '../../../app/state/app_state_scope.dart';
import '../../../app/theme/app_colors.dart';
import '../../article/presentation/article_screen.dart';
import '../../today/data/demo_topics.dart';
import '../../today/domain/knowledge_topic.dart';

class ReadLaterScreen extends StatelessWidget {
  const ReadLaterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = AppStateScope.of(context);
    final topics = state.readLaterQueue
        .map(topicById)
        .whereType<KnowledgeTopic>()
        .toList();

    return Scaffold(
      appBar: AppBar(title: const Text('ler depois')),
      body: SafeArea(
        child: topics.isEmpty
            ? const _EmptyQueue()
            : ReorderableListView.builder(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
                itemCount: topics.length,
                onReorder: (oldIndex, newIndex) =>
                    state.reorderReadLater(oldIndex, newIndex),
                itemBuilder: (context, index) {
                  final topic = topics[index];
                  return _QueueItem(
                    key: ValueKey(topic.id),
                    index: index,
                    topic: topic,
                  );
                },
              ),
      ),
    );
  }
}

class _QueueItem extends StatelessWidget {
  const _QueueItem({
    super.key,
    required this.index,
    required this.topic,
  });

  final int index;
  final KnowledgeTopic topic;

  @override
  Widget build(BuildContext context) {
    final state = AppStateScope.of(context);
    final progress = state.progressFor(topic.id);

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: AppColors.paperWhite,
        border: Border.all(color: AppColors.ink),
      ),
      child: ListTile(
        leading: Text(
          (index + 1).toString().padLeft(2, '0'),
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: AppColors.blue,
              ),
        ),
        title: Text(
          topic.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          progress > 0
              ? '${(progress * 100).round()}% · ${topic.minutes} min'
              : '${topic.minutes} min · ${topic.tags.first}',
        ),
        trailing: ReorderableDragStartListener(
          index: index,
          child: const Icon(Icons.drag_handle),
        ),
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (_) => ArticleScreen(topic: topic),
          ),
        ),
      ),
    );
  }
}

class _EmptyQueue extends StatelessWidget {
  const _EmptyQueue();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Text(
          'Sua fila está vazia. Nos artigos, use o botão “ler depois” para montar a próxima sequência.',
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
