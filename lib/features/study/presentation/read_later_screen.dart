import 'package:flutter/material.dart';

import '../../../app/state/app_state_scope.dart';
import '../../article/presentation/article_screen.dart';
import '../../today/data/demo_topics.dart';
import '../../today/domain/knowledge_topic.dart';
import '../data/personal_library_engine.dart';

class ReadLaterScreen extends StatefulWidget {
  const ReadLaterScreen({super.key});

  @override
  State<ReadLaterScreen> createState() => _ReadLaterScreenState();
}

class _ReadLaterScreenState extends State<ReadLaterScreen> {
  static const _engine = PersonalLibraryEngine();
  int _budgetMinutes = 15;
  bool _showSmartPlan = true;

  @override
  Widget build(BuildContext context) {
    final state = AppStateScope.of(context);
    final topics = state.readLaterQueue
        .map(topicById)
        .whereType<KnowledgeTopic>()
        .toList();
    final smartPlan = _engine.smartQueue(
      state,
      budgetMinutes: _budgetMinutes,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('ler depois'),
        actions: [
          IconButton(
            tooltip: _showSmartPlan
                ? 'Esconder fila inteligente'
                : 'Organizar para mim',
            onPressed: () =>
                setState(() => _showSmartPlan = !_showSmartPlan),
            icon: Icon(
              _showSmartPlan
                  ? Icons.auto_awesome
                  : Icons.auto_awesome_outlined,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            if (_showSmartPlan)
              _SmartQueuePanel(
                minutes: _budgetMinutes,
                topics: smartPlan,
                onMinutesChanged: (value) =>
                    setState(() => _budgetMinutes = value),
              ),
            Expanded(
              child: topics.isEmpty
                  ? const _EmptyQueue()
                  : ReorderableListView.builder(
                      padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
                      itemCount: topics.length,
                      onReorderItem: (oldIndex, newIndex) =>
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
          ],
        ),
      ),
    );
  }
}

class _SmartQueuePanel extends StatelessWidget {
  const _SmartQueuePanel({
    required this.minutes,
    required this.topics,
    required this.onMinutesChanged,
  });

  final int minutes;
  final List<KnowledgeTopic> topics;
  final ValueChanged<int> onMinutesChanged;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    const options = [5, 10, 15, 30];

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 10, 16, 0),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colors.surfaceContainerHighest,
        border: Border.all(color: colors.primary),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.auto_awesome, color: colors.primary),
              const SizedBox(width: 9),
              Expanded(
                child: Text(
                  'organizar para mim',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 15,
                      ),
                ),
              ),
              Text(
                '$minutes min',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: colors.primary,
                      fontSize: 10,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 11),
          Wrap(
            spacing: 7,
            runSpacing: 7,
            children: options
                .map(
                  (value) => ChoiceChip(
                    label: Text('$value min'),
                    selected: value == minutes,
                    onSelected: (_) => onMinutesChanged(value),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 14),
          if (topics.isEmpty)
            Text(
              'Nada urgente agora. Sua fila manual continua logo abaixo.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colors.onSurfaceVariant,
                  ),
            )
          else
            ...topics.indexed.map(
              (item) => InkWell(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (_) => ArticleScreen(topic: item.$2),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 7),
                  child: Row(
                    children: [
                      Text(
                        '0${item.$1 + 1}',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: colors.primary,
                              fontSize: 9,
                            ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          item.$2.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                        ),
                      ),
                      const Icon(Icons.arrow_forward, size: 16),
                    ],
                  ),
                ),
              ),
            ),
        ],
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
    final colors = Theme.of(context).colorScheme;

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: colors.surface,
        border: Border.all(color: colors.outline),
      ),
      child: ListTile(
        leading: Text(
          (index + 1).toString().padLeft(2, '0'),
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: colors.primary,
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
          'Sua fila manual está vazia. A fila inteligente acima ainda pode sugerir revisões, retomadas e descobertas.',
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
