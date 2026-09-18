import 'package:flutter/material.dart';

import '../../../app/state/app_state_scope.dart';
import '../../../app/theme/app_colors.dart';
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
    final fallbackIds = state.historyTopicIds.take(4).toList();
    final ids = dueIds.isNotEmpty ? dueIds : fallbackIds;
    final topics = ids
        .map(topicById)
        .whereType<KnowledgeTopic>()
        .toList(growable: false);

    if (topics.isEmpty) {
      return const _NoReviewsYet();
    }

    final topic = topics[_index % topics.length];
    final isDue = dueIds.contains(topic.id);

    return Scaffold(
      backgroundColor: AppColors.paper,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 28, 20, 32),
          children: [
            Row(
              children: [
                Text(
                  'revisar',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const Spacer(),
                Text(
                  isDue ? 'HOJE' : 'AQUECIMENTO',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: AppColors.blue,
                        fontSize: 10,
                        letterSpacing: 1.1,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Poucos minutos para transformar leitura em memória.',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.muted,
                  ),
            ),
            const SizedBox(height: 34),
            Container(
              padding: const EdgeInsets.fromLTRB(22, 24, 22, 26),
              decoration: BoxDecoration(
                color: AppColors.paperWhite,
                border: Border.all(color: AppColors.ink),
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
                    topic.tags.join(' · ').toUpperCase(),
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: AppColors.blue,
                          fontSize: 9,
                          letterSpacing: 1.1,
                        ),
                  ),
                  const SizedBox(height: 18),
                  Text(
                    'Você consegue explicar…',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppColors.muted,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    topic.title.toLowerCase(),
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          fontSize: 38,
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
                      color: AppColors.softBlue,
                      child: Text(
                        topic.quickTake,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontSize: 17,
                            ),
                      ),
                    ),
                    const SizedBox(height: 22),
                    Text(
                      'COMO FOI?',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: AppColors.muted,
                            fontSize: 10,
                            letterSpacing: 1.1,
                          ),
                    ),
                    const SizedBox(height: 10),
                    _ReviewChoice(
                      label: 'lembrei fácil',
                      icon: Icons.sentiment_satisfied_alt,
                      onTap: () => _answer(topic.id, 2, topics.length),
                    ),
                    _ReviewChoice(
                      label: 'mais ou menos',
                      icon: Icons.sentiment_neutral,
                      onTap: () => _answer(topic.id, 1, topics.length),
                    ),
                    _ReviewChoice(
                      label: 'não lembrei',
                      icon: Icons.refresh,
                      onTap: () => _answer(topic.id, 0, topics.length),
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 22),
            Text(
              'Repetições ficam mais espaçadas quando você lembra com facilidade.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.muted,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _answer(String topicId, int quality, int total) async {
    await AppStateScope.read(context).recordReview(
      topicId,
      quality: quality,
    );
    if (!mounted) {
      return;
    }
    setState(() {
      _revealed = false;
      _index = (_index + 1) % total;
    });
  }
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
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: AppColors.line),
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
      backgroundColor: AppColors.paper,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'revisar',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const Spacer(),
              Text(
                'primeiro, alimente sua biblioteca.',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 12),
              Text(
                'Quando você terminar algumas leituras, elas voltam aqui no momento certo para você realmente lembrar.',
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
