import 'package:flutter/material.dart';

import '../../../app/state/app_state_scope.dart';
import '../../../app/theme/app_colors.dart';
import '../../article/presentation/article_screen.dart';
import '../../today/data/demo_topics.dart';
import '../../today/domain/knowledge_topic.dart';

class HighlightsScreen extends StatelessWidget {
  const HighlightsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = AppStateScope.of(context);
    final entries = <_PassageEntry>[];

    for (final mapEntry in state.highlightedPassages.entries) {
      final topic = topicById(mapEntry.key);
      if (topic == null) {
        continue;
      }
      for (final passageId in mapEntry.value) {
        final text = _textFor(topic, passageId);
        if (text != null) {
          entries.add(
            _PassageEntry(
              topic: topic,
              passageId: passageId,
              text: text,
              starred: state.isPassageStarred(topic.id, passageId),
            ),
          );
        }
      }
    }

    entries.sort((a, b) {
      if (a.starred != b.starred) {
        return a.starred ? -1 : 1;
      }
      return a.topic.title.compareTo(b.topic.title);
    });

    return Scaffold(
      appBar: AppBar(title: const Text('marcações')),
      body: SafeArea(
        child: entries.isEmpty
            ? const _EmptyHighlights()
            : ListView.separated(
                padding: const EdgeInsets.fromLTRB(16, 14, 16, 34),
                itemCount: entries.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final entry = entries[index];
                  return Material(
                    color: AppColors.paperWhite,
                    child: InkWell(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (_) =>
                              ArticleScreen(topic: entry.topic),
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.ink),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    entry.topic.title,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge
                                        ?.copyWith(
                                          color: AppColors.blue,
                                          fontSize: 9,
                                        ),
                                  ),
                                ),
                                IconButton(
                                  tooltip: entry.starred
                                      ? 'Desfavoritar trecho'
                                      : 'Favoritar trecho',
                                  onPressed: () => state.togglePassageStar(
                                    entry.topic.id,
                                    entry.passageId,
                                  ),
                                  icon: Icon(
                                    entry.starred
                                        ? Icons.star
                                        : Icons.star_border,
                                    color: entry.starred
                                        ? AppColors.blue
                                        : AppColors.ink,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 7),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(14),
                              color: const Color(0xFFFFF0A8),
                              child: Text(
                                entry.text,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }

  static String? _textFor(KnowledgeTopic topic, String id) {
    if (id == 'quick') return topic.quickTake;
    if (id == 'why') return topic.whyItMatters;
    if (id == 'curiosity') return topic.curiosity;
    if (id.startsWith('body:')) {
      final index = int.tryParse(id.split(':').last);
      if (index != null && index >= 0 && index < topic.body.length) {
        return topic.body[index];
      }
    }
    if (id.startsWith('remember:')) {
      final index = int.tryParse(id.split(':').last);
      if (index != null && index >= 0 && index < topic.remember.length) {
        return topic.remember[index];
      }
    }
    return null;
  }
}

class _PassageEntry {
  const _PassageEntry({
    required this.topic,
    required this.passageId,
    required this.text,
    required this.starred,
  });

  final KnowledgeTopic topic;
  final String passageId;
  final String text;
  final bool starred;
}

class _EmptyHighlights extends StatelessWidget {
  const _EmptyHighlights();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(26),
        child: Text(
          'Ainda não há marcações. Nos artigos, toque no marca-texto ao lado dos trechos que quiser guardar.',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
