import 'package:flutter/material.dart';

import '../../../app/state/app_state_scope.dart';
import '../domain/review_session_progress.dart';
import '../domain/highlight_recall.dart';
import '../domain/upcoming_reviews.dart';
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
  bool _ready = false;
  bool _submitting = false;
  late List<_Flashcard> _sessionCards;
  late ReviewSessionProgress _progress;

  // Snapshot the session: rescheduling one topic must not remove or skip
  // the remaining cards from today's practice.
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_ready) _prepareSession();
  }

  void _prepareSession() {
    final state = AppStateScope.read(context);
    final dueIds = state.dueReviewTopicIds();
    final isDueSession = dueIds.isNotEmpty;
    final ids =
        isDueSession ? dueIds : state.historyTopicIds.take(5).toList();
    _sessionCards = _cards(ids);
    _progress = ReviewSessionProgress(isDueSession: isDueSession);
    _ready = true;
  }

  void _restartSession() {
    setState(() {
      _index = 0;
      _revealed = false;
      _ready = false;
      _prepareSession();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_sessionCards.isEmpty) {
      return const _NoReviewsYet();
    }

    if (_index >= _sessionCards.length) {
      return _ReviewSessionComplete(
        isDueSession: _progress.isDueSession,
        completedCards: _sessionCards.length,
        completedTopics: _progress.completedTopics,
        onRestart: _restartSession,
      );
    }

    final card = _sessionCards[_index];
    final isDue = _progress.isDueSession;
    final cards = _sessionCards;

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

      // Only passages intentionally marked by this reader. Up to two per
      // topic keep review sessions finite and the existing one-grade-per-
      // topic scheduling intact.
      final selectedPassages = <String>{
        ...?state.highlightedPassages[topic.id],
        ...?state.starredPassages[topic.id],
      };
      for (final highlighted in highlightedRecallFor(topic, selectedPassages)) {
        cards.add(_Flashcard(
          topic: topic,
          prompt: highlighted.prompt,
          answer: highlighted.answer,
        ));
      }
    }

    return cards;
  }

  Future<void> _answer(String topicId, int quality, int total) async {
    if (_submitting || _index >= total) return;
    _submitting = true;
    final lastForTopic = _index + 1 == total ||
        _sessionCards[_index + 1].topic.id != topicId;
    final grade = _progress.gradeForAnswer(
      topicId,
      quality,
      isLastForTopic: lastForTopic,
    );

    try {
      // One grade per due TOPIC, using its weakest answer. Warm-up cards
      // must not silently postpone a review that was scheduled for later.
      if (grade != null) {
        await AppStateScope.read(context).recordReview(
          topicId,
          quality: grade,
        );
      }
      if (lastForTopic) _progress.completeTopic(topicId);
      if (!mounted) return;
      setState(() {
        _revealed = false;
        _index += 1;
      });
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Não foi possível salvar a revisão. Tente novamente.')),
      );
    } finally {
      _submitting = false;
    }
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

class _ReviewSessionComplete extends StatelessWidget {
  const _ReviewSessionComplete({
    required this.isDueSession,
    required this.completedCards,
    required this.completedTopics,
    required this.onRestart,
  });

  final bool isDueSession;
  final int completedCards;
  final int completedTopics;
  final VoidCallback onRestart;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final upcoming = upcomingReviews(
      AppStateScope.of(context).reviewDueByTopic,
      now: DateTime.now(),
    ).where((entry) => topicById(entry.key) != null).take(3).toList();

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            const SizedBox(height: 56),
            Text(
              isDueSession ? 'revisões concluídas.' : 'aquecimento concluído.',
              style: theme.textTheme.headlineLarge,
            ),
            const SizedBox(height: 16),
            Text(
              '$completedCards cartões · $completedTopics assuntos',
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              isDueSession
                  ? 'A sua próxima revisão segue o calendário que você já criou.'
                  : 'Você praticou sem alterar as próximas revisões agendadas.',
              style: theme.textTheme.bodyLarge,
            ),
            if (upcoming.isNotEmpty) ...[
              const SizedBox(height: 38),
              Text(
                'PRÓXIMAS REVISÕES',
                style: theme.textTheme.labelLarge?.copyWith(
                  color: theme.colorScheme.primary,
                  fontSize: 10,
                  letterSpacing: 1.1,
                ),
              ),
              const SizedBox(height: 12),
              for (final entry in upcoming) ...[
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        topicById(entry.key)!.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      _formatReviewDate(entry.value),
                      style: theme.textTheme.labelLarge,
                    ),
                  ],
                ),
                const Divider(height: 22),
              ],
              Text(
                'Datas previstas, não notificações. Você pode revisar quando quiser.',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
            const SizedBox(height: 64),
            FilledButton(
              onPressed: onRestart,
              child: const Text('ver revisões disponíveis'),
            ),
          ],
        ),
      ),
    );
  }

  String _formatReviewDate(DateTime when) {
    final local = when.toLocal();
    final day = local.day.toString().padLeft(2, '0');
    final month = local.month.toString().padLeft(2, '0');
    return '$day/$month';
  }
}
