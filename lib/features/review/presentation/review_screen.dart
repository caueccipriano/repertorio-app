import 'package:flutter/material.dart';

import '../../../app/state/app_state_scope.dart';
import '../../today/data/demo_topics.dart';
import '../../today/domain/knowledge_topic.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  int _index = 0;
  bool _revealed = false;

  @override
  Widget build(BuildContext context) {
    final state = AppStateScope.of(context);
    final dueIds = state.dueReviewTopicIds();
    final seedIds =
        dueIds.isNotEmpty ? dueIds : state.historyTopicIds.take(5).toList();
    final cards = _cards(seedIds);

    if (cards.isEmpty) {
      return const _NoReviewsYet();
    }

    final card = cards[_index % cards.length];
    final isDue = dueIds.contains(card.topic.id);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 28, 20, 32),
          children: [
            Row(
              children: [
                Text(
                  'flashcards',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const Spacer(),
                Text(
                  isDue ? 'REVISÃO' : 'AQUECIMENTO',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 10,
                        letterSpacing: 1.1,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Gerados a partir do que você leu, lembrou e anotou.',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
            const SizedBox(height: 34),
            Container(
              padding: const EdgeInsets.fromLTRB(22, 24, 22, 26),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                border: Border.all(color: Theme.of(context).colorScheme.onSurface),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x18000000),
                    offset: Offset(5, 6),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    card.topic.tags.join(' · ').toUpperCase(),
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 9,
                          letterSpacing: 1.1,
                        ),
                  ),
                  const SizedBox(height: 18),
                  Text(
                    card.prompt,
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          fontSize: 35,
                        ),
                  ),
                  const SizedBox(height: 26),
                  if (!_revealed)
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: () => setState(() => _revealed = true),
                        child: const Text('mostrar resposta'),
                      ),
                    )
                  else ...[
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(18),
                      color: Theme.of(context).colorScheme.surfaceContainerHighest,
                      child: Text(
                        card.answer,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontSize: 17,
                            ),
                      ),
                    ),
                    const SizedBox(height: 22),
                    Text(
                      'COMO FOI?',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                            fontSize: 10,
                            letterSpacing: 1.1,
                          ),
                    ),
                    const SizedBox(height: 10),
                    _ReviewChoice(
                      label: 'lembrei fácil',
                      icon: Icons.sentiment_satisfied_alt,
                      onTap: () => _answer(
                        card.topic.id,
                        2,
                        cards.length,
                      ),
                    ),
                    _ReviewChoice(
                      label: 'mais ou menos',
                      icon: Icons.sentiment_neutral,
                      onTap: () => _answer(
                        card.topic.id,
                        1,
                        cards.length,
                      ),
                    ),
                    _ReviewChoice(
                      label: 'não lembrei',
                      icon: Icons.refresh,
                      onTap: () => _answer(
                        card.topic.id,
                        0,
                        cards.length,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text(
              '${(_index % cards.length) + 1} de ${cards.length} cartões',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    fontSize: 9,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  List<_Flashcard> _cards(List<String> ids) {
    final state = AppStateScope.read(context);
    final cards = <_Flashcard>[];

    for (final id in ids) {
      final topic = topicById(id);
      if (topic == null) continue;

      cards.add(
        _Flashcard(
          topic: topic,
          prompt: 'Explique: ${topic.title.toLowerCase()}',
          answer: topic.quickTake,
        ),
      );

      for (final item in topic.remember.indexed) {
        cards.add(
          _Flashcard(
            topic: topic,
            prompt:
                'O que vale lembrar sobre ${topic.title.toLowerCase()}? #${item.$1 + 1}',
            answer: item.$2,
          ),
        );
      }

      final note = state.noteFor(topic.id);
      if (note.isNotEmpty) {
        cards.add(
          _Flashcard(
            topic: topic,
            prompt: 'O que você anotou sobre este assunto?',
            answer: note,
          ),
        );
      }
    }

    return cards;
  }

  Future<void> _answer(String topicId, int quality, int total) async {
    await AppStateScope.read(context).recordReview(
      topicId,
      quality: quality,
    );
    if (!mounted) return;

    setState(() {
      _revealed = false;
      _index = (_index + 1) % total;
    });
  }
}

class _Flashcard {
  const _Flashcard({
    required this.topic,
    required this.prompt,
    required this.answer,
  });

  final KnowledgeTopic topic;
  final String prompt;
  final String answer;
}

class _ReviewChoice extends StatelessWidget {
  const _ReviewChoice({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 13),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Theme.of(context).colorScheme.outline,
            ),
          ),
        ),
        child: Row(
          children: [
            Icon(icon, size: 20),
            const SizedBox(width: 12),
            Text(
              label,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 15,
                  ),
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward, size: 17),
          ],
        ),
      ),
    );
  }
}

class _NoReviewsYet extends StatelessWidget {
  const _NoReviewsYet();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'flashcards',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const Spacer(),
              Text(
                'primeiro, alimente sua biblioteca.',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 12),
              Text(
                'Abra alguns assuntos e seus cartões começam a aparecer aqui automaticamente.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
