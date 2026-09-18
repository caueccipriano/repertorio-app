import 'package:flutter/material.dart';

import '../../../app/state/app_state_scope.dart';
import '../../../app/theme/app_colors.dart';
import '../../today/data/demo_topics.dart';
import '../../today/domain/knowledge_topic.dart';

class WeeklyReportScreen extends StatelessWidget {
  const WeeklyReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = AppStateScope.of(context);
    final topics = state.historyTopicIds
        .map(topicById)
        .whereType<KnowledgeTopic>()
        .where((topic) {
          final opened = state.lastOpenedByTopic[topic.id];
          if (opened == null) return false;
          return DateTime.now().difference(opened).inDays < 7;
        })
        .toList();

    final tags = <String, int>{};
    for (final topic in topics) {
      for (final tag in topic.tags) {
        tags.update(tag, (value) => value + 1, ifAbsent: () => 1);
      }
    }

    final sortedTags = tags.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return Scaffold(
      appBar: AppBar(title: const Text('sua semana')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(18, 18, 18, 36),
          children: [
            Text(
              'uma semana de curiosidade.',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(height: 12),
            _StatsRow(
              days: state.studiedDaysThisWeek(),
              topics: topics.length,
              minutes: state.studiedMinutesEstimate(),
            ),
            const SizedBox(height: 28),
            Text(
              'o que apareceu mais',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontSize: 30,
                  ),
            ),
            const SizedBox(height: 12),
            if (sortedTags.isEmpty)
              Text(
                'Ainda não há leitura suficiente nesta semana para montar seu resumo.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.muted,
                    ),
              )
            else
              ...sortedTags.take(5).map(
                    (entry) => Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          Expanded(child: Text(entry.key)),
                          Text(
                            entry.value.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(color: AppColors.blue),
                          ),
                        ],
                      ),
                    ),
                  ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(18),
              color: AppColors.deepBlue,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'PRÓXIMA SEMANA',
                    style: TextStyle(
                      color: Colors.white60,
                      fontSize: 9,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _suggestion(sortedTags),
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _suggestion(List<MapEntry<String, int>> tags) {
    if (tags.isEmpty) {
      return 'Comece por um assunto curto e deixe a primeira conexão puxar a próxima.';
    }
    final dominant = tags.first.key;
    return 'Você passou bastante por $dominant. Que tal buscar um assunto de outra área e criar uma conexão inesperada?';
  }
}

class _StatsRow extends StatelessWidget {
  const _StatsRow({
    required this.days,
    required this.topics,
    required this.minutes,
  });

  final int days;
  final int topics;
  final int minutes;

  @override
  Widget build(BuildContext context) {
    final items = [
      (days.toString(), 'dias'),
      (topics.toString(), 'assuntos'),
      (minutes.toString(), 'min estimados'),
    ];

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.ink),
        color: AppColors.paperWhite,
      ),
      child: Row(
        children: items.indexed
            .map(
              (item) => Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    border: item.$1 == items.length - 1
                        ? null
                        : const Border(
                            right: BorderSide(color: AppColors.ink),
                          ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        item.$2.$1,
                        style: Theme.of(context).textTheme.displayMedium?.copyWith(
                              color: AppColors.blue,
                              fontSize: 34,
                            ),
                      ),
                      Text(
                        item.$2.$2,
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: AppColors.muted,
                              fontSize: 9,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
