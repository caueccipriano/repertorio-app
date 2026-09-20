import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../app/state/app_state_scope.dart';
import '../../article/presentation/article_screen.dart';
import '../../today/data/demo_topics.dart';
import '../../today/domain/knowledge_topic.dart';
import 'viral_entry_gate.dart';

class ViralScoreHomeCard extends StatefulWidget {
  const ViralScoreHomeCard({super.key});

  @override
  State<ViralScoreHomeCard> createState() => _ViralScoreHomeCardState();
}

class _ViralScoreHomeCardState extends State<ViralScoreHomeCard> {
  static const _historyKey = 'viral_score_history_v1';
  static const _weakCategoriesKey = 'viral_score_weak_categories_v1';

  List<_ScoreSnapshot> _history = const [];
  List<String> _weakCategories = const [];

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    final rawHistory = prefs.getStringList(_historyKey) ?? const <String>[];
    final parsed = rawHistory
        .map(_ScoreSnapshot.tryParse)
        .whereType<_ScoreSnapshot>()
        .take(5)
        .toList();

    if (!mounted) return;
    setState(() {
      _history = parsed;
      _weakCategories =
          prefs.getStringList(_weakCategoriesKey) ?? const <String>[];
    });
  }

  Future<void> _retakeScore() async {
    await Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => ViralEntryExperience(
          onEnterApp: (result) async {
            if (result != null) {
              final prefs = await SharedPreferences.getInstance();
              await prefs.setInt('viral_score_v1', result.score);
              await prefs.setString('viral_archetype_v1', result.archetype);
            }
            if (!mounted) return;
            Navigator.of(context).pop();
          },
        ),
      ),
    );

    if (!mounted) return;
    await _load();
  }

  @override
  Widget build(BuildContext context) {
    if (_history.isEmpty) return const SizedBox.shrink();

    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final state = AppStateScope.of(context);
    final latest = _history.first;
    final recommendations = _recommendations(
      weakCategories: _weakCategories,
      excludedIds: state.historyTopicIds.toSet(),
    );
    final previous = _history.length > 1 ? _history[1] : null;
    final delta = previous == null ? null : latest.score - previous.score;

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 14),
      decoration: BoxDecoration(
        color: colors.surface,
        border: Border.all(color: colors.outline),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'SEU REPERTÓRIO SCORE',
                style: textTheme.labelLarge?.copyWith(
                  color: colors.primary,
                  fontSize: 9,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.2,
                ),
              ),
              const Spacer(),
              Expanded(
                child: Text(
                  latest.archetype,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.end,
                  style: textTheme.labelSmall?.copyWith(
                    color: colors.onSurfaceVariant,
                    fontWeight: FontWeight.w800,
                    letterSpacing: .35,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          LayoutBuilder(
            builder: (context, constraints) {
              final compact = constraints.maxWidth < 520;
              final scoreBlock = _ScoreSummary(
                score: latest.score,
                delta: delta,
              );
              final chart = _ScoreSparkline(history: _history);

              if (compact) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    scoreBlock,
                    const SizedBox(height: 14),
                    SizedBox(height: 74, child: chart),
                  ],
                );
              }

              return Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(flex: 4, child: scoreBlock),
                  const SizedBox(width: 18),
                  Expanded(flex: 6, child: SizedBox(height: 84, child: chart)),
                ],
              );
            },
          ),
          if (recommendations.isNotEmpty) ...[
            const SizedBox(height: 18),
            Divider(height: 1, color: colors.outline),
            const SizedBox(height: 14),
            Text(
              _weakCategories.isEmpty
                  ? 'PRÓXIMAS CONEXÕES'
                  : 'FORTALEÇA SEU RADAR',
              style: textTheme.labelLarge?.copyWith(
                color: colors.primary,
                fontSize: 9,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.05,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              _weakCategories.isEmpty
                  ? 'três assuntos para continuar crescendo'
                  : 'com base nas áreas que mais pediram reforço na sua última rodada',
              style: textTheme.bodySmall?.copyWith(
                color: colors.onSurfaceVariant,
                height: 1.35,
              ),
            ),
            const SizedBox(height: 10),
            ...recommendations.indexed.map(
              (entry) => _RecommendationRow(
                index: entry.$1 + 1,
                topic: entry.$2,
              ),
            ),
          ],
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton.icon(
              onPressed: _retakeScore,
              icon: const Icon(Icons.refresh_rounded, size: 17),
              label: const Text(
                'NOVA RODADA',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  letterSpacing: .55,
                  fontSize: 11,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<KnowledgeTopic> _recommendations({
    required List<String> weakCategories,
    required Set<String> excludedIds,
  }) {
    final ordered = <KnowledgeTopic>[];
    final seen = <String>{};

    for (final category in weakCategories) {
      final tags = _tagsForCategory(category);
      final candidates = allDemoTopics.where((topic) {
        if (excludedIds.contains(topic.id) || seen.contains(topic.id)) {
          return false;
        }
        final haystack = <String>{
          ...topic.tags.map(_normalize),
          _normalize(topic.eyebrow),
          _normalize(topic.title),
        }.join(' ');
        return tags.any((tag) => haystack.contains(tag));
      });

      for (final topic in candidates) {
        if (seen.add(topic.id)) ordered.add(topic);
        if (ordered.length >= 3) return ordered;
      }
    }

    for (final topic in allDemoTopics) {
      if (excludedIds.contains(topic.id) || !seen.add(topic.id)) continue;
      ordered.add(topic);
      if (ordered.length >= 3) break;
    }

    return ordered;
  }

  List<String> _tagsForCategory(String category) {
    return switch (category) {
      'PSICOLOGIA' => ['psicologia', 'comportamento', 'mente'],
      'HISTÓRIA' => ['historia', 'imperio', 'guerra'],
      'CIÊNCIA' => ['ciencia', 'astronomia', 'biologia', 'universo'],
      'ECONOMIA' => ['economia', 'dinheiro', 'financas', 'inflacao'],
      'ARTE & DESIGN' => ['arte', 'design', 'arquitetura', 'tipografia'],
      'TECNOLOGIA' => ['tecnologia', 'internet', 'ia', 'digital'],
      'MUNDO' => ['mundo', 'geografia', 'politica', 'cidade'],
      'CULTURA' => ['cultura', 'literatura', 'cinema', 'musica'],
      _ => [_normalize(category)],
    };
  }

  String _normalize(String value) {
    return value
        .toLowerCase()
        .replaceAll(RegExp(r'[áàâã]'), 'a')
        .replaceAll(RegExp(r'[éèê]'), 'e')
        .replaceAll(RegExp(r'[íìî]'), 'i')
        .replaceAll(RegExp(r'[óòôõ]'), 'o')
        .replaceAll(RegExp(r'[úùû]'), 'u')
        .replaceAll('ç', 'c');
  }
}

class _ScoreSummary extends StatelessWidget {
  const _ScoreSummary({
    required this.score,
    required this.delta,
  });

  final int score;
  final int? delta;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final signal = delta == null || delta == 0
        ? null
        : delta! > 0
            ? '+$delta'
            : '$delta';

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          '$score',
          style: textTheme.displayMedium?.copyWith(
            color: colors.primary,
            fontSize: 58,
            height: .86,
            fontWeight: FontWeight.w900,
            letterSpacing: -3.2,
          ),
        ),
        if (signal != null) ...[
          const SizedBox(width: 10),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                decoration: BoxDecoration(
                  color: colors.primaryContainer,
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  '$signal vs. anterior',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.labelSmall?.copyWith(
                    color: colors.onPrimaryContainer,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}

class _ScoreSparkline extends StatelessWidget {
  const _ScoreSparkline({required this.history});

  final List<_ScoreSnapshot> history;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final chronological = history.reversed.toList();

    return CustomPaint(
      painter: _ScoreSparklinePainter(
        scores: chronological.map((item) => item.score).toList(),
        lineColor: colors.primary,
        guideColor: colors.outline,
        fillColor: colors.primaryContainer.withValues(alpha: .42),
      ),
      child: Align(
        alignment: Alignment.bottomRight,
        child: Text(
          history.length == 1
              ? '1 rodada'
              : '${history.length} últimas rodadas',
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: colors.onSurfaceVariant,
                fontSize: 9,
                fontWeight: FontWeight.w700,
              ),
        ),
      ),
    );
  }
}

class _ScoreSparklinePainter extends CustomPainter {
  _ScoreSparklinePainter({
    required this.scores,
    required this.lineColor,
    required this.guideColor,
    required this.fillColor,
  });

  final List<int> scores;
  final Color lineColor;
  final Color guideColor;
  final Color fillColor;

  @override
  void paint(Canvas canvas, Size size) {
    if (scores.isEmpty) return;

    final chartHeight = size.height - 20;
    final guide = Paint()
      ..color = guideColor
      ..strokeWidth = 1;

    canvas.drawLine(
      Offset(0, chartHeight),
      Offset(size.width, chartHeight),
      guide,
    );

    double yFor(int score) {
      final progress = ((score - 390) / 440).clamp(0.0, 1.0);
      return chartHeight - (progress * (chartHeight - 8));
    }

    if (scores.length == 1) {
      final dot = Paint()..color = lineColor;
      canvas.drawCircle(Offset(size.width / 2, yFor(scores.first)), 4, dot);
      return;
    }

    final step = size.width / (scores.length - 1);
    final path = Path();
    final fillPath = Path();

    for (var i = 0; i < scores.length; i++) {
      final point = Offset(step * i, yFor(scores[i]));
      if (i == 0) {
        path.moveTo(point.dx, point.dy);
        fillPath.moveTo(point.dx, chartHeight);
        fillPath.lineTo(point.dx, point.dy);
      } else {
        path.lineTo(point.dx, point.dy);
        fillPath.lineTo(point.dx, point.dy);
      }
    }

    fillPath
      ..lineTo(size.width, chartHeight)
      ..close();

    canvas.drawPath(fillPath, Paint()..color = fillColor);
    canvas.drawPath(
      path,
      Paint()
        ..color = lineColor
        ..strokeWidth = 3
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round
        ..style = PaintingStyle.stroke,
    );

    final dot = Paint()..color = lineColor;
    for (var i = 0; i < scores.length; i++) {
      canvas.drawCircle(Offset(step * i, yFor(scores[i])), 3.5, dot);
    }
  }

  @override
  bool shouldRepaint(covariant _ScoreSparklinePainter oldDelegate) {
    return oldDelegate.scores != scores ||
        oldDelegate.lineColor != lineColor ||
        oldDelegate.guideColor != guideColor ||
        oldDelegate.fillColor != fillColor;
  }
}

class _RecommendationRow extends StatelessWidget {
  const _RecommendationRow({
    required this.index,
    required this.topic,
  });

  final int index;
  final KnowledgeTopic topic;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return InkWell(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (_) => ArticleScreen(topic: topic),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: colors.outline),
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 28,
              child: Text(
                '0$index',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: colors.primary,
                      fontSize: 10,
                      fontWeight: FontWeight.w900,
                    ),
              ),
            ),
            Expanded(
              child: Text(
                topic.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                      height: 1.18,
                    ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              '${topic.minutes} min',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: colors.onSurfaceVariant,
                    fontSize: 9,
                  ),
            ),
            const SizedBox(width: 5),
            const Icon(Icons.arrow_outward_rounded, size: 16),
          ],
        ),
      ),
    );
  }
}

class _ScoreSnapshot {
  const _ScoreSnapshot({
    required this.score,
    required this.date,
    required this.archetype,
  });

  final int score;
  final DateTime date;
  final String archetype;

  static _ScoreSnapshot? tryParse(String raw) {
    final parts = raw.split('|');
    if (parts.length < 3) return null;
    final score = int.tryParse(parts[0]);
    final date = DateTime.tryParse(parts[1]);
    if (score == null || date == null) return null;
    return _ScoreSnapshot(
      score: score,
      date: date,
      archetype: parts.sublist(2).join('|'),
    );
  }
}
