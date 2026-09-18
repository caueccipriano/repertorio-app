import 'package:flutter/material.dart';

import '../../../app/state/app_state_scope.dart';
import '../../article/presentation/article_screen.dart';
import '../../today/data/demo_topics.dart';
import '../../today/domain/knowledge_topic.dart';

class PersonalConnectionsScreen extends StatelessWidget {
  const PersonalConnectionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = AppStateScope.of(context);
    final connections = state.personalConnections;

    return Scaffold(
      appBar: AppBar(
        title: const Text('suas conexões'),
        actions: [
          IconButton(
            tooltip: 'Criar conexão',
            onPressed: () => _createConnection(context),
            icon: const Icon(Icons.add_link),
          ),
        ],
      ),
      body: SafeArea(
        child: connections.isEmpty
            ? _EmptyConnections(
                onCreate: () => _createConnection(context),
              )
            : ListView.separated(
                padding: const EdgeInsets.fromLTRB(16, 14, 16, 34),
                itemCount: connections.length,
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  final connection = connections[index];
                  final from = topicById(connection.fromTopicId);
                  final to = topicById(connection.toTopicId);
                  if (from == null || to == null) {
                    return const SizedBox.shrink();
                  }
                  return _ConnectionCard(
                    index: index,
                    from: from,
                    to: to,
                    note: connection.note,
                  );
                },
              ),
      ),
    );
  }

  Future<void> _createConnection(BuildContext context) async {
    final state = AppStateScope.read(context);
    final explored = state.historyTopicIds
        .map(topicById)
        .whereType<KnowledgeTopic>()
        .toList();

    if (explored.length < 2) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Explore pelo menos dois assuntos para criar uma conexão pessoal.',
          ),
        ),
      );
      return;
    }

    String fromId = explored[0].id;
    String toId = explored[1].id;
    final controller = TextEditingController();

    final result = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: const Text('nova conexão'),
            content: SizedBox(
              width: 520,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DropdownButtonFormField<String>(
                    initialValue: fromId,
                    decoration: const InputDecoration(
                      labelText: 'de',
                    ),
                    items: explored
                        .map(
                          (topic) => DropdownMenuItem(
                            value: topic.id,
                            child: Text(
                              topic.title,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      if (value != null) {
                        setState(() => fromId = value);
                      }
                    },
                  ),
                  const SizedBox(height: 12),
                  DropdownButtonFormField<String>(
                    initialValue: toId,
                    decoration: const InputDecoration(
                      labelText: 'para',
                    ),
                    items: explored
                        .map(
                          (topic) => DropdownMenuItem(
                            value: topic.id,
                            child: Text(
                              topic.title,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      if (value != null) {
                        setState(() => toId = value);
                      }
                    },
                  ),
                  const SizedBox(height: 14),
                  TextField(
                    controller: controller,
                    minLines: 3,
                    maxLines: 6,
                    decoration: const InputDecoration(
                      labelText: 'o que conecta essas ideias?',
                      hintText: 'Isso me lembra…',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(dialogContext).pop(false),
                child: const Text('cancelar'),
              ),
              FilledButton(
                onPressed: fromId == toId
                    ? null
                    : () => Navigator.of(dialogContext).pop(true),
                child: const Text('salvar conexão'),
              ),
            ],
          );
        },
      ),
    );

    final note = controller.text;
    controller.dispose();

    if (result != true || !context.mounted) {
      return;
    }

    await state.addPersonalConnection(
      fromTopicId: fromId,
      toTopicId: toId,
      note: note,
    );
  }
}

class _ConnectionCard extends StatelessWidget {
  const _ConnectionCard({
    required this.index,
    required this.from,
    required this.to,
    required this.note,
  });

  final int index;
  final KnowledgeTopic from;
  final KnowledgeTopic to;
  final String note;

  @override
  Widget build(BuildContext context) {
    final state = AppStateScope.of(context);
    final colors = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colors.surface,
        border: Border.all(color: colors.outline),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: _TopicChip(topic: from),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Icon(
                  Icons.sync_alt,
                  color: colors.primary,
                ),
              ),
              Expanded(
                child: _TopicChip(topic: to),
              ),
              IconButton(
                tooltip: 'Excluir conexão',
                onPressed: () => state.deletePersonalConnection(index),
                icon: const Icon(Icons.delete_outline),
              ),
            ],
          ),
          if (note.isNotEmpty) ...[
            const SizedBox(height: 12),
            Text(
              note,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colors.onSurfaceVariant,
                  ),
            ),
          ],
        ],
      ),
    );
  }
}

class _TopicChip extends StatelessWidget {
  const _TopicChip({required this.topic});

  final KnowledgeTopic topic;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (_) => ArticleScreen(topic: topic),
        ),
      ),
      child: Text(
        topic.title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
              fontSize: 9,
            ),
      ),
    );
  }
}

class _EmptyConnections extends StatelessWidget {
  const _EmptyConnections({required this.onCreate});

  final VoidCallback onCreate;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(26),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.add_link, size: 38),
            const SizedBox(height: 18),
            Text(
              'registre conexões que só você percebeu.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: onCreate,
              child: const Text('criar conexão'),
            ),
          ],
        ),
      ),
    );
  }
}
