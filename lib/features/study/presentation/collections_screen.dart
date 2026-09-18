import 'package:flutter/material.dart';

import '../../../app/state/app_state_scope.dart';
import '../../../app/theme/app_colors.dart';
import '../../article/presentation/article_screen.dart';
import '../../today/data/demo_topics.dart';
import '../../today/domain/knowledge_topic.dart';

class CollectionsScreen extends StatelessWidget {
  const CollectionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = AppStateScope.of(context);
    final entries = state.collectionsByName.entries.toList()
      ..sort((a, b) => a.key.compareTo(b.key));

    return Scaffold(
      appBar: AppBar(
        title: const Text('coleções'),
        actions: [
          IconButton(
            tooltip: 'Nova coleção',
            onPressed: () => _createCollection(context),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: SafeArea(
        child: entries.isEmpty
            ? _EmptyCollections(
                onCreate: () => _createCollection(context),
              )
            : ListView.separated(
                padding: const EdgeInsets.fromLTRB(16, 14, 16, 34),
                itemCount: entries.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final entry = entries[index];
                  return _CollectionCard(
                    name: entry.key,
                    topicIds: entry.value,
                  );
                },
              ),
      ),
    );
  }

  Future<void> _createCollection(BuildContext context) async {
    final controller = TextEditingController();

    final name = await showDialog<String>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('nova coleção'),
        content: TextField(
          controller: controller,
          autofocus: true,
          decoration: const InputDecoration(
            hintText: 'Ex.: Coisas para conversar melhor',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('cancelar'),
          ),
          FilledButton(
            onPressed: () =>
                Navigator.of(dialogContext).pop(controller.text.trim()),
            child: const Text('criar'),
          ),
        ],
      ),
    );

    controller.dispose();

    if (name == null || name.isEmpty || !context.mounted) {
      return;
    }

    await AppStateScope.read(context).createCollection(name);
  }
}

class _CollectionCard extends StatelessWidget {
  const _CollectionCard({
    required this.name,
    required this.topicIds,
  });

  final String name;
  final List<String> topicIds;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final topics = topicIds.map(topicById).whereType<KnowledgeTopic>().toList();

    return Material(
      color: colors.surface,
      child: InkWell(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (_) => CollectionDetailScreen(name: name),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: colors.outline),
          ),
          child: Row(
            children: [
              Container(
                width: 54,
                height: 70,
                decoration: BoxDecoration(
                  color: colors.surfaceContainerHighest,
                  border: Border.all(color: colors.outline),
                ),
                child: Icon(
                  Icons.collections_bookmark_outlined,
                  color: colors.primary,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontSize: 16,
                          ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      topics.isEmpty
                          ? 'vazia'
                          : '${topics.length} assunto${topics.length == 1 ? '' : 's'}',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: colors.onSurfaceVariant,
                          ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }
}

class CollectionDetailScreen extends StatelessWidget {
  const CollectionDetailScreen({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    final state = AppStateScope.of(context);
    final topicIds = state.collectionsByName[name] ?? const <String>[];
    final topics = topicIds.map(topicById).whereType<KnowledgeTopic>().toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        actions: [
          IconButton(
            tooltip: 'Adicionar assuntos',
            onPressed: () => _pickTopics(context),
            icon: const Icon(Icons.add),
          ),
          PopupMenuButton<String>(
            onSelected: (value) async {
              if (value == 'delete') {
                await AppStateScope.read(context).deleteCollection(name);
                if (context.mounted) {
                  Navigator.of(context).pop();
                }
              }
            },
            itemBuilder: (_) => const [
              PopupMenuItem(
                value: 'delete',
                child: Text('excluir coleção'),
              ),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: topics.isEmpty
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: FilledButton.icon(
                    onPressed: () => _pickTopics(context),
                    icon: const Icon(Icons.add),
                    label: const Text('adicionar assuntos'),
                  ),
                ),
              )
            : ListView.separated(
                padding: const EdgeInsets.fromLTRB(16, 14, 16, 34),
                itemCount: topics.length,
                separatorBuilder: (_, __) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  final topic = topics[index];
                  return ListTile(
                    title: Text(topic.title),
                    subtitle: Text(
                      '${topic.tags.join(' · ')} · ${topic.minutes} min',
                    ),
                    trailing: IconButton(
                      tooltip: 'Remover da coleção',
                      onPressed: () =>
                          state.toggleTopicInCollection(name, topic.id),
                      icon: const Icon(Icons.remove_circle_outline),
                    ),
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

  Future<void> _pickTopics(BuildContext context) async {
    final state = AppStateScope.read(context);

    await showModalBottomSheet<void>(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (sheetContext) {
        return SizedBox(
          height: MediaQuery.sizeOf(sheetContext).height * .78,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 16, 12, 10),
                child: Row(
                  children: [
                    Text(
                      'adicionar assuntos',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () => Navigator.of(sheetContext).pop(),
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),
              Expanded(
                child: ListView(
                  children: allDemoTopics
                      .map(
                        (topic) => StatefulBuilder(
                          builder: (context, setLocalState) {
                            final selected =
                                state.topicInCollection(name, topic.id);
                            return CheckboxListTile(
                              value: selected,
                              title: Text(topic.title),
                              subtitle: Text(topic.tags.join(' · ')),
                              onChanged: (_) async {
                                await state.toggleTopicInCollection(
                                  name,
                                  topic.id,
                                );
                                setLocalState(() {});
                              },
                            );
                          },
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _EmptyCollections extends StatelessWidget {
  const _EmptyCollections({required this.onCreate});

  final VoidCallback onCreate;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(26),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 460),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.collections_bookmark_outlined, size: 38),
              const SizedBox(height: 18),
              Text(
                'crie suas próprias prateleiras.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 10),
              Text(
                'Um mesmo assunto pode fazer parte de várias coleções.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
              const SizedBox(height: 20),
              FilledButton(
                onPressed: onCreate,
                child: const Text('criar primeira coleção'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
