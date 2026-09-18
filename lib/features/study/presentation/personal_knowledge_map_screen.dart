import 'package:flutter/material.dart';

import '../../../app/state/app_state.dart';
import '../../../app/state/app_state_scope.dart';
import '../../article/presentation/article_screen.dart';
import '../../explore/data/knowledge_graph.dart';
import '../../today/data/demo_topics.dart';
import '../../today/domain/knowledge_topic.dart';

class PersonalKnowledgeMapScreen extends StatelessWidget {
  const PersonalKnowledgeMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = AppStateScope.of(context);
    final colors = Theme.of(context).colorScheme;
    final ids = {
      ...state.historyTopicIds,
      ...state.completedTopicIds,
    };
    final topics = ids
        .map(topicById)
        .whereType<KnowledgeTopic>()
        .toList(growable: false);

    return Scaffold(
      appBar: AppBar(title: const Text('seu mapa')),
      body: SafeArea(
        child: topics.isEmpty
            ? const _EmptyMap()
            : LayoutBuilder(
                builder: (context, constraints) {
                  final size = Size(
                    constraints.maxWidth,
                    constraints.maxHeight,
                  );
                  final positions = _positions(size, topics.length);

                  return InteractiveViewer(
                    minScale: .7,
                    maxScale: 2.4,
                    boundaryMargin: const EdgeInsets.all(120),
                    child: SizedBox(
                      width: size.width,
                      height: size.height,
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: CustomPaint(
                              painter: _PersonalMapPainter(
                                topics: topics,
                                positions: positions,
                                personalConnections:
                                    state.personalConnections,
                                staticLine: colors.primary.withValues(alpha: .23),
                                personalLine:
                                    colors.secondary.withValues(alpha: .8),
                              ),
                            ),
                          ),
                          for (var i = 0; i < topics.length; i++)
                            _Node(
                              topic: topics[i],
                              center: positions[i],
                              mastery: state.masteryLevel(topics[i].id),
                              score: state.masteryScore(topics[i].id),
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }

  List<Offset> _positions(Size size, int count) {
    final center = Offset(size.width / 2, size.height / 2);
    final radiusX = (size.width * .34).clamp(120, 300).toDouble();
    final radiusY = (size.height * .33).clamp(150, 340).toDouble();

    return List.generate(count, (index) {
      if (count == 1) return center;
      final angle = (index / count) * 6.28318530718 - 1.5708;
      return Offset(
        center.dx + radiusX * _cos(angle),
        center.dy + radiusY * _sin(angle),
      );
    });
  }

  double _sin(double x) {
    var value = x;
    while (value > 3.14159265359) {
      value -= 6.28318530718;
    }
    while (value < -3.14159265359) {
      value += 6.28318530718;
    }
    final x2 = value * value;
    return value *
        (1 - x2 / 6 + x2 * x2 / 120 - x2 * x2 * x2 / 5040);
  }

  double _cos(double x) => _sin(x + 1.57079632679);
}

class _Node extends StatelessWidget {
  const _Node({
    required this.topic,
    required this.center,
    required this.mastery,
    required this.score,
  });

  final KnowledgeTopic topic;
  final Offset center;
  final MasteryLevel mastery;
  final double score;

  @override
  Widget build(BuildContext context) {
    const width = 122.0;
    const height = 78.0;
    final colors = Theme.of(context).colorScheme;
    final consolidated = mastery == MasteryLevel.consolidated;
    final background = switch (mastery) {
      MasteryLevel.newTopic => colors.surface,
      MasteryLevel.familiar => colors.surfaceContainerHighest,
      MasteryLevel.understood => colors.primaryContainer,
      MasteryLevel.consolidated => colors.primary,
    };
    final foreground = consolidated ? colors.onPrimary : colors.onSurface;

    return Positioned(
      left: center.dx - width / 2,
      top: center.dy - height / 2,
      width: width,
      height: height,
      child: Material(
        color: background,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: colors.outline),
          borderRadius: BorderRadius.circular(3),
        ),
        child: InkWell(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (_) => ArticleScreen(topic: topic),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(9),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  topic.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: foreground,
                        fontSize: 9,
                        height: 1.1,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${_label(mastery)} · ${(score * 100).round()}%',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: consolidated
                            ? colors.onPrimary.withValues(alpha: .75)
                            : colors.onSurfaceVariant,
                        fontSize: 8,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _label(MasteryLevel level) {
    return switch (level) {
      MasteryLevel.newTopic => 'novo',
      MasteryLevel.familiar => 'familiar',
      MasteryLevel.understood => 'entendido',
      MasteryLevel.consolidated => 'consolidado',
    };
  }
}

class _PersonalMapPainter extends CustomPainter {
  const _PersonalMapPainter({
    required this.topics,
    required this.positions,
    required this.personalConnections,
    required this.staticLine,
    required this.personalLine,
  });

  final List<KnowledgeTopic> topics;
  final List<Offset> positions;
  final List<PersonalConnection> personalConnections;
  final Color staticLine;
  final Color personalLine;

  @override
  void paint(Canvas canvas, Size size) {
    final line = Paint()
      ..color = staticLine
      ..strokeWidth = 1.4;

    final personal = Paint()
      ..color = personalLine
      ..strokeWidth = 2.4
      ..strokeCap = StrokeCap.round;

    final indexById = <String, int>{
      for (var i = 0; i < topics.length; i++) topics[i].id: i,
    };

    for (var i = 0; i < topics.length; i++) {
      for (final neighbor in neighborsFor(topics[i].id)) {
        final j = indexById[neighbor];
        if (j == null || j <= i) continue;
        canvas.drawLine(positions[i], positions[j], line);
      }
    }

    for (final connection in personalConnections) {
      final from = indexById[connection.fromTopicId];
      final to = indexById[connection.toTopicId];
      if (from == null || to == null) continue;
      canvas.drawLine(positions[from], positions[to], personal);
      final midpoint = Offset(
        (positions[from].dx + positions[to].dx) / 2,
        (positions[from].dy + positions[to].dy) / 2,
      );
      canvas.drawCircle(midpoint, 4, personal);
    }
  }

  @override
  bool shouldRepaint(covariant _PersonalMapPainter oldDelegate) => true;
}

class _EmptyMap extends StatelessWidget {
  const _EmptyMap();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(26),
        child: Text(
          'Seu mapa ainda não tem nós. Abra o primeiro assunto e ele começa a crescer.',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
