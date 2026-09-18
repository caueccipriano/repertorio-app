import 'package:flutter/material.dart';

import '../../../app/state/app_state_scope.dart';
import '../../../app/theme/app_colors.dart';
import '../../review/presentation/review_screen.dart';
import '../../today/data/demo_topics.dart';
import '../../today/domain/knowledge_topic.dart';
import '../data/study_content.dart';
import 'comparisons_screen.dart';
import 'entities_screen.dart';
import 'highlights_screen.dart';
import 'history_screen.dart';
import 'personal_knowledge_map_screen.dart';
import 'quiz_screen.dart';
import 'read_later_screen.dart';
import 'timeline_screen.dart';
import 'weekly_report_screen.dart';

class StudyHubScreen extends StatelessWidget {
  const StudyHubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = AppStateScope.of(context);
    final quizTopic = _quizTopic(state.historyTopicIds);

    final tools = <_StudyTool>[
      _StudyTool(
        title: 'flashcards',
        subtitle: 'Revisão espaçada do que você já viu.',
        icon: Icons.style_outlined,
        badge: state.dueReviewTopicIds().isEmpty
            ? null
            : '${state.dueReviewTopicIds().length}',
        onTap: () => _push(context, const ReviewScreen()),
      ),
      _StudyTool(
        title: 'quiz',
        subtitle: quizTopic == null
            ? 'Leia um assunto para liberar perguntas.'
            : 'Teste ${quizTopic.tags.first} em poucos minutos.',
        icon: Icons.quiz_outlined,
        badge: state.totalQuizAttempts == 0
            ? null
            : '${state.totalQuizAttempts}',
        onTap: quizTopic == null
            ? null
            : () => _push(
                  context,
                  QuizScreen(topic: quizTopic),
                ),
      ),
      _StudyTool(
        title: 'ler depois',
        subtitle: 'Sua fila ordenável de próximas leituras.',
        icon: Icons.playlist_add_check_circle_outlined,
        badge: state.readLaterQueue.isEmpty
            ? null
            : '${state.readLaterQueue.length}',
        onTap: () => _push(context, const ReadLaterScreen()),
      ),
      _StudyTool(
        title: 'marcações',
        subtitle: 'Trechos destacados e favoritos.',
        icon: Icons.border_color_outlined,
        badge: _highlightCount(state) == 0
            ? null
            : '${_highlightCount(state)}',
        onTap: () => _push(context, const HighlightsScreen()),
      ),
      _StudyTool(
        title: 'histórico',
        subtitle: 'Hoje, ontem e tudo que você abriu.',
        icon: Icons.history,
        badge: state.historyTopicIds.isEmpty
            ? null
            : '${state.historyTopicIds.length}',
        onTap: () => _push(context, const HistoryScreen()),
      ),
      _StudyTool(
        title: 'seu mapa',
        subtitle: 'Veja sua biblioteca mental crescer.',
        icon: Icons.hub_outlined,
        onTap: () => _push(
          context,
          const PersonalKnowledgeMapScreen(),
        ),
      ),
      _StudyTool(
        title: 'linha do tempo',
        subtitle: 'Coloque ideias e movimentos no contexto.',
        icon: Icons.timeline,
        onTap: () => _push(context, const TimelineScreen()),
      ),
      _StudyTool(
        title: 'comparar',
        subtitle: 'Entenda diferenças lado a lado.',
        icon: Icons.compare_arrows,
        onTap: () => _push(context, const ComparisonsScreen()),
      ),
      _StudyTool(
        title: 'pessoas · lugares',
        subtitle: 'Mini-fichas que conectam o repertório.',
        icon: Icons.public_outlined,
        onTap: () => _push(context, const EntitiesScreen()),
      ),
      _StudyTool(
        title: 'sua semana',
        subtitle: 'Relatório editorial do que você estudou.',
        icon: Icons.insights_outlined,
        onTap: () => _push(context, const WeeklyReportScreen()),
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.paper,
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 22, 16, 32),
          children: [
            Text(
              'estudar',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'Consumir é só o começo. Aqui você transforma leitura em memória, conexão e repertório.',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.muted,
                  ),
            ),
            const SizedBox(height: 24),
            _StudySummary(
              due: state.dueReviewTopicIds().length,
              queue: state.readLaterQueue.length,
              highlights: _highlightCount(state),
            ),
            const SizedBox(height: 24),
            LayoutBuilder(
              builder: (context, constraints) {
                final columns = constraints.maxWidth >= 680 ? 3 : 2;
                const gap = 10.0;
                final width =
                    (constraints.maxWidth - gap * (columns - 1)) / columns;

                return Wrap(
                  spacing: gap,
                  runSpacing: gap,
                  children: tools
                      .map(
                        (tool) => SizedBox(
                          width: width,
                          child: _ToolCard(tool: tool),
                        ),
                      )
                      .toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  KnowledgeTopic? _quizTopic(List<String> history) {
    for (final id in history) {
      final topic = topicById(id);
      if (topic != null && quizFor(topic.id).isNotEmpty) {
        return topic;
      }
    }

    for (final topic in allDemoTopics) {
      if (quizFor(topic.id).isNotEmpty) {
        return topic;
      }
    }
    return null;
  }

  int _highlightCount(dynamic state) {
    var count = 0;
    for (final set in state.highlightedPassages.values) {
      count += set.length as int;
    }
    return count;
  }

  void _push(BuildContext context, Widget screen) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => screen),
    );
  }
}

class _StudySummary extends StatelessWidget {
  const _StudySummary({
    required this.due,
    required this.queue,
    required this.highlights,
  });

  final int due;
  final int queue;
  final int highlights;

  @override
  Widget build(BuildContext context) {
    final values = [
      (due, 'revisões'),
      (queue, 'na fila'),
      (highlights, 'marcações'),
    ];

    return Container(
      decoration: BoxDecoration(
        color: AppColors.deepBlue,
        border: Border.all(color: AppColors.ink),
      ),
      child: Row(
        children: values.indexed
            .map(
              (item) => Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    border: item.$1 == values.length - 1
                        ? null
                        : const Border(
                            right: BorderSide(color: Colors.white24),
                          ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        item.$2.$1.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(
                              color: Colors.white,
                              fontSize: 34,
                            ),
                      ),
                      Text(
                        item.$2.$2,
                        style: const TextStyle(
                          color: Colors.white60,
                          fontSize: 9,
                          fontWeight: FontWeight.w700,
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

class _ToolCard extends StatelessWidget {
  const _ToolCard({required this.tool});

  final _StudyTool tool;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.paperWhite,
      child: InkWell(
        onTap: tool.onTap,
        child: Container(
          constraints: const BoxConstraints(minHeight: 146),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.ink),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(tool.icon, size: 24),
                  const Spacer(),
                  if (tool.badge != null)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 7,
                        vertical: 3,
                      ),
                      decoration: const BoxDecoration(
                        color: AppColors.blue,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        tool.badge!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 9,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                ],
              ),
              const Spacer(),
              Text(
                tool.title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 15,
                    ),
              ),
              const SizedBox(height: 5),
              Text(
                tool.subtitle,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.muted,
                      height: 1.3,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StudyTool {
  const _StudyTool({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
    this.badge,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback? onTap;
  final String? badge;
}
