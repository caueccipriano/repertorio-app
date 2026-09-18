import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../article/presentation/article_screen.dart';
import '../../today/data/demo_topics.dart';
import '../../today/domain/knowledge_topic.dart';
import '../data/knowledge_graph.dart';

class KnowledgeMapScreen extends StatelessWidget {
  const KnowledgeMapScreen({
    super.key,
    required this.rootTopicId,
  });

  final String rootTopicId;

  @override
  Widget build(BuildContext context) {
    final root = topicById(rootTopicId) ?? bauhausTopic;
    final neighbors = neighborsFor(root.id)
        .map(topicById)
        .whereType<KnowledgeTopic>()
        .take(4)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('mapa do conhecimento'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 10, 18, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'RABBIT HOLE',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          letterSpacing: 1.2,
                          fontSize: 10,
                        ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    'uma ideia puxa outra.',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(height: 7),
                  Text(
                    'Toque em qualquer nó para continuar explorando.',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final size = Size(
                    constraints.maxWidth,
                    constraints.maxHeight,
                  );
                  final center = Offset(
                    size.width / 2,
                    size.height / 2,
                  );
                  final points = _positions(size, neighbors.length);

                  return Stack(
                    children: [
                      Positioned.fill(
                        child: CustomPaint(
                          painter: _MapPainter(
                            center: center,
                            points: points,
                          ),
                        ),
                      ),
                      _TopicNode(
                        topic: root,
                        center: center,
                        emphasized: true,
                      ),
                      for (var i = 0; i < neighbors.length; i++)
                        _TopicNode(
                          topic: neighbors[i],
                          center: points[i],
                        ),
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 8, 18, 22),
              child: Row(
                children: [
                  const Icon(
                    Icons.circle,
                    color: Theme.of(context).colorScheme.primary,
                    size: 10,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Cada leitura abre novas conexões. O mapa cresce com seu repertório.',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
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

  List<Offset> _positions(Size size, int count) {
    final cx = size.width / 2;
    final cy = size.height / 2;
    final dx = size.width * .32;
    final dy = size.height * .30;

    const candidates = <Offset>[
      Offset(-1, -1),
      Offset(1, -1),
      Offset(-1, 1),
      Offset(1, 1),
    ];

    return candidates
        .take(count)
        .map(
          (p) => Offset(
            cx + p.dx * dx,
            cy + p.dy * dy,
          ),
        )
        .toList();
  }
}

class _TopicNode extends StatelessWidget {
  const _TopicNode({
    required this.topic,
    required this.center,
    this.emphasized = false,
  });

  final KnowledgeTopic topic;
  final Offset center;
  final bool emphasized;

  @override
  Widget build(BuildContext context) {
    final width = emphasized ? 142.0 : 118.0;
    final height = emphasized ? 88.0 : 76.0;

    return Positioned(
      left: center.dx - width / 2,
      top: center.dy - height / 2,
      width: width,
      height: height,
      child: Material(
        color: emphasized ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.surface,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).colorScheme.onSurface,
            width: emphasized ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(3),
        ),
        child: InkWell(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (_) => ArticleScreen(topic: topic),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  topic.title,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: emphasized ? Colors.white : Theme.of(context).colorScheme.onSurface,
                        fontSize: emphasized ? 11 : 9,
                        height: 1.1,
                      ),
                ),
                const SizedBox(height: 5),
                Text(
                  '${topic.minutes} min',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: emphasized
                            ? Colors.white70
                            : Theme.of(context).colorScheme.onSurfaceVariant,
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
}

class _MapPainter extends CustomPainter {
  const _MapPainter({
    required this.center,
    required this.points,
  });

  final Offset center;
  final List<Offset> points;

  @override
  void paint(Canvas canvas, Size size) {
    final line = Paint()
      ..color = Theme.of(context).colorScheme.onSurface.withValues(alpha: .42)
      ..strokeWidth = 1.3
      ..style = PaintingStyle.stroke;

    final accent = Paint()
      ..color = Theme.of(context).colorScheme.primary.withValues(alpha: .18)
      ..strokeWidth = 12
      ..strokeCap = StrokeCap.round;

    for (final point in points) {
      canvas.drawLine(center, point, accent);
      canvas.drawLine(center, point, line);
    }
  }

  @override
  bool shouldRepaint(covariant _MapPainter oldDelegate) =>
      oldDelegate.center != center || oldDelegate.points != points;
}
