import 'package:flutter/material.dart';

import '../../../app/state/app_state_scope.dart';
import '../../article/presentation/article_screen.dart';
import '../../today/data/demo_topics.dart';
import '../../today/domain/knowledge_topic.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = AppStateScope.of(context);
    final notes = state.notesByTopic.entries
        .map((entry) {
          final topic = topicById(entry.key);
          if (topic == null) {
            return null;
          }
          return _NoteEntry(topic: topic, note: entry.value);
        })
        .whereType<_NoteEntry>()
        .toList()
      ..sort((a, b) => a.topic.title.compareTo(b.topic.title));

    return Scaffold(
      appBar: AppBar(title: const Text('minhas notas')),
      body: SafeArea(
        child: notes.isEmpty
            ? const _EmptyNotes()
            : ListView.separated(
                padding: const EdgeInsets.fromLTRB(18, 14, 18, 34),
                itemCount: notes.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final entry = notes[index];
                  return _NoteCard(entry: entry);
                },
              ),
      ),
    );
  }
}

class _NoteCard extends StatelessWidget {
  const _NoteCard({required this.entry});

  final _NoteEntry entry;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.surface,
      child: InkWell(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (_) => ArticleScreen(topic: entry.topic),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).colorScheme.onSurface),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                entry.topic.tags.join(' · ').toUpperCase(),
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 9,
                      letterSpacing: 1,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                entry.topic.title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 16,
                    ),
              ),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                child: Text(
                  entry.note,
                  maxLines: 8,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        height: 1.45,
                      ),
                ),
              ),
              const SizedBox(height: 11),
              Row(
                children: [
                  Text(
                    'abrir assunto',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                          fontSize: 9,
                        ),
                  ),
                  const Spacer(),
                  const Icon(Icons.arrow_forward, size: 18),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _EmptyNotes extends StatelessWidget {
  const _EmptyNotes();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(26),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 440),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.sticky_note_2_outlined, size: 36),
              const SizedBox(height: 20),
              Text(
                'seu caderno ainda está vazio.',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 10),
              Text(
                'Dentro de qualquer leitura, toque no ícone de nota para guardar uma ideia, conexão ou exemplo que queira lembrar.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NoteEntry {
  const _NoteEntry({
    required this.topic,
    required this.note,
  });

  final KnowledgeTopic topic;
  final String note;
}
