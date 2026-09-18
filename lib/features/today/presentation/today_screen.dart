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
import '../data/demo_topics.dart';
import '../domain/knowledge_topic.dart';

class TodayScreen extends StatelessWidget {
  const TodayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = AppStateScope.of(context);
    final featured = _featuredTopic(state.historyTopicIds);
    final dailyTopics = _dailyTopics();
    final continueTopic = _continueTopic(state.progressByTopic);
    final outsideBubble = _outsideBubble(state.historyTopicIds);

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
                _FeaturedKnowledge(topic: featured),
                const SizedBox(height: 14),
                _QuickActions(rootTopic: featured),
                const SizedBox(height: 26),
                _Shelf(
                  title: 'para hoje',
                  subtitle: 'uma pequena edição diária',
                  topics: dailyTopics,
                ),
                if (continueTopic != null) ...[
                  const SizedBox(height: 28),
                  _ContinueShelf(
                    topic: continueTopic,
                    progress: state.progressFor(continueTopic.id),
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
                const Center(
                  child: HandNote(
                    'sua biblioteca mental cresce uma leitura por vez.',
                    fontSize: 20,
                    color: AppColors.muted,
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
    if (historyIds.isNotEmpty) {
      final topic = topicById(historyIds.first);
      if (topic != null) {
        return topic;
      }
    }

    final index = DateTime.now().day % allDemoTopics.length;
    return allDemoTopics[index];
  }

  List<KnowledgeTopic> _dailyTopics() {
    final start = DateTime.now().day % allDemoTopics.length;
    return List.generate(
      4,
      (index) => allDemoTopics[(start + index) % allDemoTopics.length],
    );
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
                color: AppColors.blue,
                fontWeight: FontWeight.w800,
                letterSpacing: -.7,
              ),
        ),
        const Spacer(),
        Text(
          dateLabel,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                fontSize: 10,
                color: AppColors.muted,
                letterSpacing: .7,
              ),
        ),
        const SizedBox(width: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.line),
          ),
          child: Text(
            '$read lidos',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontSize: 9,
                  color: AppColors.muted,
                ),
          ),
        ),
      ],
    );
  }
}

class _FeaturedKnowledge extends StatelessWidget {
  const _FeaturedKnowledge({required this.topic});

  final KnowledgeTopic topic;

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
        final height = wide ? 330.0 : 264.0;

        return Container(
          height: height,
          padding: EdgeInsets.all(wide ? 18 : 12),
          decoration: BoxDecoration(
            color: AppColors.paperWhite,
            border: Border.all(color: AppColors.ink, width: 1.2),
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
                            color: AppColors.blue,
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
                      topic.tags.join(' · '),
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: AppColors.muted,
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
                            border: Border.all(color: AppColors.ink),
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
    final actions = <_QuickAction>[
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
      height: 44,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.ink),
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
                      : const Border(
                          right: BorderSide(color: AppColors.ink),
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
                      color: AppColors.muted,
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
                  color: AppColors.muted,
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
                color: AppColors.paperWhite,
                border: Border.all(color: AppColors.ink),
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
                                    color: AppColors.muted,
                                    fontSize: 10,
                                  ),
                        ),
                        const SizedBox(height: 12),
                        LinearProgressIndicator(
                          value: progress,
                          minHeight: 5,
                          color: AppColors.blue,
                          backgroundColor: AppColors.line,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          '$percent% lido',
                          style:
                              Theme.of(context).textTheme.labelLarge?.copyWith(
                                    color: AppColors.blue,
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
      color: AppColors.paperWhite,
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
            border: Border.all(color: AppColors.ink),
          ),
          child: Row(
            children: [
              const Icon(
                Icons.shuffle_rounded,
                color: AppColors.blue,
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
                            color: AppColors.blue,
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
            border: Border.all(color: AppColors.ink),
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
