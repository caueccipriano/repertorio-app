import 'package:flutter/material.dart';

import '../../../app/state/app_state_scope.dart';
import '../../../core/widgets/knowledge_cover.dart';
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
              KnowledgeCover(
                title: name,
                kicker: 'coleção',
                style: _collectionStyle(name),
                width: 62,
                height: 82,
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

KnowledgeCoverStyle _collectionStyle(String name) {
  final styles = KnowledgeCoverStyle.values;
  final normalized = name.trim().toLowerCase();
  final score = normalized.runes.fold<int>(0, (sum, rune) => sum + rune);
  return styles[score % styles.length];
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
        title: const Text('coleção'),
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
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 14, 16, 34),
          children: [
            _CollectionHero(
              name: name,
              count: topics.length,
              onAdd: () => _pickTopics(context),
            ),
            const SizedBox(height: 24),
            if (topics.isEmpty)
              _CollectionEmptyState(
                onAdd: () => _pickTopics(context),
              )
            else ...[
              Text(
                'assuntos nesta coleção',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontSize: 28,
                    ),
              ),
              const SizedBox(height: 5),
              Text(
                'Uma prateleira feita por você.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
              const SizedBox(height: 12),
              ...topics.indexed.map(
                (item) => _CollectionTopicRow(
                  index: item.$1 + 1,
                  topic: item.$2,
                  onRemove: () =>
                      state.toggleTopicInCollection(name, item.$2.id),
                ),
              ),
            ],
          ],
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

class _CollectionHero extends StatelessWidget {
  const _CollectionHero({
    required this.name,
    required this.count,
    required this.onAdd,
  });

  final String name;
  final int count;
  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colors.surface,
        border: Border.all(color: colors.outline),
      ),
      child: SizedBox(
        height: 142,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            KnowledgeCover(
              title: name,
              kicker: 'coleção pessoal',
              style: _collectionStyle(name),
              width: 104,
              height: 142,
              selected: true,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'SUA PRATELEIRA',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: colors.primary,
                          fontSize: 9,
                          letterSpacing: 1.1,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    name,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          fontSize: 31,
                          height: .98,
                        ),
                  ),
                  const Spacer(),
                  Text(
                    count == 0
                        ? 'ainda vazia'
                        : '${count} assunto${count == 1 ? '' : 's'} guardado${count == 1 ? '' : 's'}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: colors.onSurfaceVariant,
                        ),
                  ),
                  const SizedBox(height: 9),
                  FilledButton.icon(
                    onPressed: onAdd,
                    icon: const Icon(Icons.add, size: 18),
                    label: const Text('adicionar'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CollectionEmptyState extends StatelessWidget {
  const _CollectionEmptyState({required this.onAdd});

  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: colors.surfaceContainerHighest,
        border: Border.all(color: colors.outline),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.library_add_outlined, color: colors.primary, size: 28),
          const SizedBox(height: 16),
          Text(
            'comece a montar esta prateleira.',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontSize: 30,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'Adicione assuntos que você quer aproximar, comparar ou lembrar juntos.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: colors.onSurfaceVariant,
                ),
          ),
          const SizedBox(height: 16),
          OutlinedButton.icon(
            onPressed: onAdd,
            icon: const Icon(Icons.add, size: 18),
            label: const Text('escolher assuntos'),
          ),
        ],
      ),
    );
  }
}

class _CollectionTopicRow extends StatelessWidget {
  const _CollectionTopicRow({
    required this.index,
    required this.topic,
    required this.onRemove,
  });

  final int index;
  final KnowledgeTopic topic;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (_) => ArticleScreen(topic: topic),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 13),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: colors.outline),
            ),
          ),
          child: Row(
            children: [
              SizedBox(
                width: 28,
                child: Text(
                  index.toString().padLeft(2, '0'),
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: colors.primary,
                        fontSize: 9,
                      ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      topic.title,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontSize: 15,
                          ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      '${topic.tags.join(' · ')} · ${topic.estimatedReadingMinutes()} min',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: colors.onSurfaceVariant,
                          ),
                    ),
                  ],
                ),
              ),
              IconButton(
                tooltip: 'Remover da coleção',
                onPressed: onRemove,
                icon: const Icon(Icons.remove_circle_outline, size: 20),
              ),
            ],
          ),
        ),
      ),
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
