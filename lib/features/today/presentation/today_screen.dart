import 'package:flutter/material.dart';

import '../../../app/state/app_state_scope.dart';
import '../../../app/theme/app_colors.dart';
import '../../../core/widgets/editorial_decorations.dart';
import '../../../core/widgets/editorial_frame.dart';
import '../../../core/widgets/knowledge_cover.dart';
import '../../../core/widgets/paper_texture.dart';
import '../../article/presentation/article_screen.dart';
import '../../article/presentation/quick_peek.dart';
import '../../explore/presentation/knowledge_map_screen.dart';
import '../../review/presentation/review_screen.dart';
import '../../search/presentation/search_screen.dart';
import '../../study/data/personal_library_engine.dart';
import '../data/demo_topics.dart';
import '../domain/knowledge_topic.dart';

class TodayScreen extends StatelessWidget {
  const TodayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = AppStateScope.of(context);
    const engine = PersonalLibraryEngine();
    final featured = _featuredTopic(state.historyTopicIds);
    final continueTopic = _continueTopic(state.progressByTopic);
    final outsideBubble = _outsideBubble(state.historyTopicIds);
    final personalTrail = _personalTrail(state.historyTopicIds);
    final recentTopics = _recentTopics(
      state.historyTopicIds,
      state.lastOpenedByTopic,
    );
    final dailyPlan = engine.dailyPlan(state, budgetMinutes: 12);
    final featuredReason = engine.reasonFor(state, featured);

    return PaperTexture(
      child: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: EditorialFrame(
            maxWidth: 860,
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _LibraryStatusBar(
                  read: state.completedTopicIds.length,
                ),
                const SizedBox(height: 16),
                _FeaturedKnowledge(
                  topic: featured,
                  reason: featuredReason,
                ),
                const SizedBox(height: 14),
                _QuickActions(rootTopic: featured),
                const SizedBox(height: 18),
                _DailyPlanCard(tasks: dailyPlan),
                const SizedBox(height: 14),
                _SurpriseStrip(
                  excludedTopicIds: {
                    ...state.historyTopicIds,
                    ...state.completedTopicIds,
                  },
                ),
                const SizedBox(height: 24),
                _PersonalTrailCard(
                  topics: personalTrail,
                  personalized: state.historyTopicIds.isNotEmpty,
                ),
                if (continueTopic != null) ...[
                  const SizedBox(height: 28),
                  _ContinueShelf(
                    topic: continueTopic,
                    progress: state.progressFor(continueTopic.id),
                  ),
                ],
                if (recentTopics.isNotEmpty) ...[
                  const SizedBox(height: 28),
                  _Shelf(
                    title: 'vistos recentemente',
                    subtitle: 'retome uma ideia ou faça uma nova conexão',
                    topics: recentTopics,
                  ),
                ],
                const SizedBox(height: 28),
                const _Shelf(
                  title: 'coisas que vale saber',
                  subtitle: 'segure uma capa para ver em 30 segundos',
                  topics: [
                    brutalismTopic,
                    wineTopic,
                    helveticaTopic,
                    inflationTopic,
                  ],
                ),
                const SizedBox(height: 28),
                _OutsideBubbleCard(topic: outsideBubble),
                const SizedBox(height: 20),
                _RabbitHoleShelf(
                  rootTopic: state.historyTopicIds.isEmpty
                      ? bauhausTopic
                      : topicById(state.historyTopicIds.first) ?? bauhausTopic,
                  hasHistory: state.historyTopicIds.isNotEmpty,
                ),
                const SizedBox(height: 18),
                Center(
                  child: HandNote(
                    'sua biblioteca mental cresce uma leitura por vez.',
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  KnowledgeTopic _featuredTopic(List<String> historyIds) {
    final unseen = allDemoTopics
        .where((topic) => !historyIds.contains(topic.id))
        .toList();
    final pool = unseen.isEmpty ? allDemoTopics : unseen;
    final index = DateTime.now().day % pool.length;
    return pool[index];
  }

  List<KnowledgeTopic> _recentTopics(
    List<String> historyIds,
    Map<String, DateTime> lastOpenedByTopic,
  ) {
    final ids = historyIds.toSet().toList()
      ..sort((a, b) {
        final aDate = lastOpenedByTopic[a] ??
            DateTime.fromMillisecondsSinceEpoch(0);
        final bDate = lastOpenedByTopic[b] ??
            DateTime.fromMillisecondsSinceEpoch(0);
        return bDate.compareTo(aDate);
      });

    return ids
        .map(topicById)
        .whereType<KnowledgeTopic>()
        .take(4)
        .toList();
  }

  KnowledgeTopic? _continueTopic(Map<String, double> progressByTopic) {
    final candidates = progressByTopic.entries
        .where((entry) => entry.value > .02 && entry.value < .92)
        .toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    if (candidates.isEmpty) {
      return null;
    }
    return topicById(candidates.first.key);
  }

  List<KnowledgeTopic> _personalTrail(List<String> historyIds) {
    final counts = <String, int>{};
    for (final id in historyIds) {
      final topic = topicById(id);
      if (topic == null) continue;
      for (final tag in topic.tags) {
        counts.update(tag, (value) => value + 1, ifAbsent: () => 1);
      }
    }

    final topics = allDemoTopics
        .where((topic) => !historyIds.contains(topic.id))
        .toList()
      ..sort((a, b) {
        final aScore = a.tags.fold<int>(
          0,
          (sum, tag) => sum + (counts[tag] ?? 0),
        );
        final bScore = b.tags.fold<int>(
          0,
          (sum, tag) => sum + (counts[tag] ?? 0),
        );
        return bScore.compareTo(aScore);
      });

    return topics.take(3).toList();
  }

  KnowledgeTopic _outsideBubble(List<String> historyIds) {
    final exploredTags = <String>{};
    for (final id in historyIds) {
      final topic = topicById(id);
      if (topic != null) {
        exploredTags.addAll(topic.tags);
      }
    }

    if (exploredTags.isEmpty) {
      return fermiTopic;
    }

    for (final topic in allDemoTopics.reversed) {
      if (topic.tags.every((tag) => !exploredTags.contains(tag))) {
        return topic;
      }
    }

    return allDemoTopics.last;
  }
}

class _LibraryStatusBar extends StatelessWidget {
  const _LibraryStatusBar({required this.read});

  final int read;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    const months = [
      'JAN',
      'FEV',
      'MAR',
      'ABR',
      'MAI',
      'JUN',
      'JUL',
      'AGO',
      'SET',
      'OUT',
      'NOV',
      'DEZ',
    ];
    final dateLabel =
        '${now.day.toString().padLeft(2, '0')} ${months[now.month - 1]}';

    return Row(
      children: [
        Text(
          'repertório*',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w800,
                letterSpacing: -.7,
              ),
        ),
        const Spacer(),
        Text(
          dateLabel,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                fontSize: 10,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
                letterSpacing: .7,
              ),
        ),
        const SizedBox(width: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).colorScheme.outline),
          ),
          child: Text(
            '$read lidos',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontSize: 9,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
          ),
        ),
      ],
    );
  }
}

class _FeaturedKnowledge extends StatelessWidget {
  const _FeaturedKnowledge({
    required this.topic,
    required this.reason,
  });

  final KnowledgeTopic topic;
  final String reason;

  @override
  Widget build(BuildContext context) {
    final style = _styleFor(topic.id);

    void open() {
      Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (_) => ArticleScreen(topic: topic),
        ),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final wide = constraints.maxWidth >= 620;
        final height = wide ? 392.0 : 264.0;

        return Container(
          height: height,
          padding: EdgeInsets.all(wide ? 18 : 12),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            border: Border.all(
              color: Theme.of(context).colorScheme.outline,
              width: 1.2,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: wide ? 5 : 46,
                child: KnowledgeCover(
                  title: topic.title,
                  kicker: topic.tags.join(' · '),
                  style: style,
                  width: double.infinity,
                  height: double.infinity,
                  selected: true,
                  onTap: open,
                  onLongPress: () => showQuickPeek(context, topic),
                ),
              ),
              SizedBox(width: wide ? 22 : 14),
              Expanded(
                flex: wide ? 7 : 54,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'DESTAQUE DE HOJE',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            fontSize: 9,
                            letterSpacing: 1.3,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                    SizedBox(height: wide ? 18 : 10),
                    Text(
                      topic.title,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                            fontSize: wide ? 45 : 29,
                            height: .95,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      reason,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      topic.tags.join(' · '),
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                            fontSize: 10,
                          ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 9,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Theme.of(context).colorScheme.onSurface),
                            borderRadius: BorderRadius.circular(99),
                          ),
                          child: Text(
                            '${topic.minutes} MIN',
                            style:
                                Theme.of(context).textTheme.labelLarge?.copyWith(
                                      fontSize: 9,
                                    ),
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          tooltip: 'Abrir leitura',
                          onPressed: open,
                          visualDensity: VisualDensity.compact,
                          icon: const Icon(Icons.arrow_forward, size: 20),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _QuickActions extends StatelessWidget {
  const _QuickActions({required this.rootTopic});

  final KnowledgeTopic rootTopic;

  @override
  Widget build(BuildContext context) {
    final state = AppStateScope.of(context);
    final quickTopic = allDemoTopics.firstWhere(
      (topic) =>
          topic.minutes <= 5 &&
          !state.completedTopicIds.contains(topic.id),
      orElse: () => allDemoTopics.first,
    );

    final actions = <_QuickAction>[
      _QuickAction(
        label: '5 MIN',
        icon: Icons.bolt_outlined,
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (_) => ArticleScreen(topic: quickTopic),
          ),
        ),
      ),
      _QuickAction(
        label: 'MAPA',
        icon: Icons.hub_outlined,
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (_) => KnowledgeMapScreen(
              rootTopicId: rootTopic.id,
            ),
          ),
        ),
      ),
      _QuickAction(
        label: 'REVISAR',
        icon: Icons.psychology_alt_outlined,
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (_) => const ReviewScreen(),
          ),
        ),
      ),
      _QuickAction(
        label: 'BUSCAR',
        icon: Icons.search,
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (_) => const SearchScreen(),
          ),
        ),
      ),
    ];

    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.onSurface),
      ),
      child: Row(
        children: actions.indexed.map((item) {
          return Expanded(
            child: InkWell(
              onTap: item.$2.onTap,
              child: Container(
                decoration: BoxDecoration(
                  border: item.$1 == actions.length - 1
                      ? null
                      : Border(
                          right: BorderSide(
                            color: Theme.of(context).colorScheme.outline,
                          ),
                        ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(item.$2.icon, size: 16),
                    const SizedBox(width: 6),
                    Text(
                      item.$2.label,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            fontSize: 9,
                            letterSpacing: .6,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _QuickAction {
  const _QuickAction({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final VoidCallback onTap;
}

class _DailyPlanCard extends StatelessWidget {
  const _DailyPlanCard({required this.tasks});

  final List<DailyTask> tasks;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final totalMinutes = tasks.fold<int>(
      0,
      (sum, task) => sum + task.minutes,
    );

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: colors.surface,
        border: Border.all(color: colors.outline),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'SEU ROTEIRO DE HOJE',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: colors.primary,
                      fontSize: 9,
                      letterSpacing: 1.1,
                    ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                color: colors.surfaceContainerHighest,
                child: Text(
                  '~$totalMinutes min',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: colors.primary,
                        fontSize: 9,
                      ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...tasks.indexed.map(
            (item) => InkWell(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (_) => ArticleScreen(topic: item.$2.topic),
                ),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: item.$1 == tasks.length - 1
                        ? BorderSide.none
                        : BorderSide(color: colors.outline),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _TaskIcon(type: item.$2.type),
                    const SizedBox(width: 11),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.$2.topic.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style:
                                Theme.of(context).textTheme.bodyMedium?.copyWith(
                                      fontWeight: FontWeight.w800,
                                    ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            item.$2.reason,
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: colors.onSurfaceVariant,
                                    ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '${item.$2.minutes} min',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: colors.primary,
                            fontSize: 9,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TaskIcon extends StatelessWidget {
  const _TaskIcon({required this.type});

  final DailyTaskType type;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final icon = switch (type) {
      DailyTaskType.discovery => Icons.explore_outlined,
      DailyTaskType.review => Icons.refresh,
      DailyTaskType.connection => Icons.hub_outlined,
      DailyTaskType.quick => Icons.bolt_outlined,
    };

    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: colors.surfaceContainerHighest,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: 16, color: colors.primary),
    );
  }
}

class _SurpriseStrip extends StatelessWidget {
  const _SurpriseStrip({required this.excludedTopicIds});

  final Set<String> excludedTopicIds;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    void surprise() {
      final candidates = allDemoTopics
          .where((topic) => !excludedTopicIds.contains(topic.id))
          .toList();
      final pool = candidates.isEmpty ? allDemoTopics : candidates;
      final index = DateTime.now().millisecondsSinceEpoch % pool.length;
      Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (_) => ArticleScreen(topic: pool[index]),
        ),
      );
    }

    return Material(
      color: colors.onSurface,
      child: InkWell(
        onTap: surprise,
        child: Container(
          minHeight: 58,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
          decoration: BoxDecoration(
            border: Border.all(color: colors.onSurface),
          ),
          child: Row(
            children: [
              Icon(
                Icons.casino_outlined,
                color: colors.surface,
                size: 21,
              ),
              const SizedBox(width: 11),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ME SURPREENDA',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: colors.surface,
                            fontSize: 9,
                            letterSpacing: 1,
                          ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'abra algo fora do roteiro',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: colors.surface.withValues(alpha: .68),
                          ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_rounded,
                color: colors.surface,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PersonalTrailCard extends StatelessWidget {
  const _PersonalTrailCard({
    required this.topics,
    required this.personalized,
  });

  final List<KnowledgeTopic> topics;
  final bool personalized;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 18),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        border: Border.all(color: Theme.of(context).colorScheme.primary),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            personalized ? 'TRILHA PARA VOCÊ' : 'COMECE POR AQUI',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 9,
                  letterSpacing: 1.1,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            personalized
                ? 'aprofundar sem ficar na mesma bolha'
                : 'uma primeira sequência para abrir caminhos',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontSize: 24,
                ),
          ),
          const SizedBox(height: 12),
          ...topics.indexed.map(
            (item) => InkWell(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (_) => ArticleScreen(topic: item.$2),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 7),
                child: Row(
                  children: [
                    Text(
                      '0${item.$1 + 1}',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 9,
                          ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        item.$2.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontSize: 14,
                            ),
                      ),
                    ),
                    const Icon(Icons.arrow_forward, size: 17),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Shelf extends StatelessWidget {
  const _Shelf({
    required this.title,
    required this.subtitle,
    required this.topics,
  });

  final String title;
  final String subtitle;
  final List<KnowledgeTopic> topics;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _ShelfHeader(title: title, subtitle: subtitle),
        const SizedBox(height: 14),
        SizedBox(
          height: 244,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            itemCount: topics.length,
            separatorBuilder: (_, __) => const SizedBox(width: 14),
            itemBuilder: (context, index) {
              return _ShelfBook(topic: topics[index]);
            },
          ),
        ),
      ],
    );
  }
}

class _ShelfHeader extends StatelessWidget {
  const _ShelfHeader({
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontSize: 31,
                    ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                      fontSize: 10,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ShelfBook extends StatelessWidget {
  const _ShelfBook({required this.topic});

  final KnowledgeTopic topic;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 138,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          KnowledgeCover(
            title: topic.title,
            kicker: topic.tags.join(' · '),
            style: _styleFor(topic.id),
            width: 132,
            height: 184,
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (_) => ArticleScreen(topic: topic),
              ),
            ),
            onLongPress: () => showQuickPeek(context, topic),
          ),
          const SizedBox(height: 9),
          Text(
            topic.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontSize: 11,
                ),
          ),
          const SizedBox(height: 2),
          Text(
            '${topic.minutes} min',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontSize: 9,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
          ),
        ],
      ),
    );
  }
}

class _ContinueShelf extends StatelessWidget {
  const _ContinueShelf({
    required this.topic,
    required this.progress,
  });

  final KnowledgeTopic topic;
  final double progress;

  @override
  Widget build(BuildContext context) {
    final percent = (progress * 100).round();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _ShelfHeader(
          title: 'continue daqui',
          subtitle: 'volte exatamente de onde parou',
        ),
        const SizedBox(height: 14),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (_) => ArticleScreen(topic: topic),
              ),
            ),
            child: Container(
              padding: const EdgeInsets.fromLTRB(14, 14, 14, 12),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                border: Border.all(
                  color: Theme.of(context).colorScheme.outline,
                ),
              ),
              child: Row(
                children: [
                  KnowledgeCover(
                    title: topic.title,
                    kicker: topic.tags.first,
                    style: _styleFor(topic.id),
                    width: 82,
                    height: 112,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          topic.title,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    fontSize: 16,
                                  ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '${topic.tags.join(' · ')} · ${topic.minutes} min',
                          style:
                              Theme.of(context).textTheme.labelLarge?.copyWith(
                                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                                    fontSize: 10,
                                  ),
                        ),
                        const SizedBox(height: 12),
                        LinearProgressIndicator(
                          value: progress,
                          minHeight: 5,
                          color: Theme.of(context).colorScheme.primary,
                          backgroundColor: Theme.of(context).colorScheme.outline,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          '$percent% lido',
                          style:
                              Theme.of(context).textTheme.labelLarge?.copyWith(
                                    color: Theme.of(context).colorScheme.primary,
                                    fontSize: 9,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _OutsideBubbleCard extends StatelessWidget {
  const _OutsideBubbleCard({required this.topic});

  final KnowledgeTopic topic;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.surface,
      child: InkWell(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (_) => ArticleScreen(topic: topic),
          ),
        ),
        onLongPress: () => showQuickPeek(context, topic),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).colorScheme.onSurface),
          ),
          child: Row(
            children: [
              Icon(
                Icons.shuffle_rounded,
                color: Theme.of(context).colorScheme.primary,
                size: 30,
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'SAIA DA SUA BOLHA',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 9,
                            letterSpacing: 1.1,
                          ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      topic.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontSize: 16,
                          ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward, size: 19),
            ],
          ),
        ),
      ),
    );
  }
}

class _RabbitHoleShelf extends StatelessWidget {
  const _RabbitHoleShelf({
    required this.rootTopic,
    required this.hasHistory,
  });

  final KnowledgeTopic rootTopic;
  final bool hasHistory;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.deepBlue,
      child: InkWell(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (_) => KnowledgeMapScreen(
              rootTopicId: rootTopic.id,
            ),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 18),
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).colorScheme.onSurface),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                hasHistory ? 'SEU RABBIT HOLE' : 'COMECE UM RABBIT HOLE',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Colors.white60,
                      fontSize: 9,
                      letterSpacing: 1.1,
                    ),
              ),
              const SizedBox(height: 12),
              Text(
                hasHistory
                    ? '${rootTopic.title} → veja as conexões'
                    : 'Bauhaus → Modernismo → Brutalismo → Helvetica',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: Colors.white,
                      fontSize: 29,
                      height: 1.05,
                    ),
              ),
              const SizedBox(height: 14),
              const Row(
                children: [
                  Text(
                    'abrir mapa',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.hub_outlined,
                    color: Colors.white,
                    size: 20,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

KnowledgeCoverStyle _styleFor(String id) {
  return switch (id) {
    'bauhaus' => KnowledgeCoverStyle.bauhaus,
    'modernismo' => KnowledgeCoverStyle.archive,
    'fermi' => KnowledgeCoverStyle.constellation,
    'roma' => KnowledgeCoverStyle.stamp,
    'brutalismo' => KnowledgeCoverStyle.archive,
    'helvetica' => KnowledgeCoverStyle.diagonal,
    'inflacao' => KnowledgeCoverStyle.columns,
    'vinho' => KnowledgeCoverStyle.waves,
    _ => KnowledgeCoverStyle.typography,
  };
}
