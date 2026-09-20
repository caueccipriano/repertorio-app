import 'dart:math' as math;

import 'package:flutter/material.dart';

class CulturalMap extends StatelessWidget {
  const CulturalMap({
    super.key,
    required this.counts,
    required this.strengths,
    required this.weakCategories,
  });

  final Map<String, int> counts;
  final List<String> strengths;
  final List<String> weakCategories;

  static const categories = <String>[
    'PSICOLOGIA',
    'HISTÓRIA',
    'CIÊNCIA',
    'ECONOMIA',
    'ARTE & DESIGN',
    'TECNOLOGIA',
    'MUNDO',
    'CULTURA',
  ];

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final maxCount = counts.values.fold<int>(
      1,
      (max, value) => value > max ? value : max,
    );
    final explored = counts.values.where((value) => value > 0).length;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 14),
      decoration: BoxDecoration(
        color: colors.surface,
        border: Border.all(color: colors.outline),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'CONSTELAÇÃO CULTURAL',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: colors.primary,
                        fontSize: 9,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.05,
                      ),
                ),
              ),
              const SizedBox(width: 8),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  '$explored/8 áreas',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: colors.onSurfaceVariant,
                        fontWeight: FontWeight.w800,
                      ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            explored == 0
                ? 'seu mapa começa quando você explora o primeiro assunto'
                : 'cada ponto cresce com o que você realmente explora no app',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: colors.onSurfaceVariant,
                  height: 1.35,
                ),
          ),
          const SizedBox(height: 16),
          AspectRatio(
            aspectRatio: 1.22,
            child: CustomPaint(
              painter: _CulturalMapPainter(
                counts: counts,
                maxCount: maxCount,
                strengths: strengths.toSet(),
                weakCategories: weakCategories.toSet(),
                primary: colors.primary,
                onSurface: colors.onSurface,
                muted: colors.onSurfaceVariant,
                line: colors.outline,
                soft: colors.primaryContainer,
              ),
              child: const SizedBox.expand(),
            ),
          ),
          const SizedBox(height: 14),
          Divider(height: 1, color: colors.outline),
          const SizedBox(height: 12),
          LayoutBuilder(
            builder: (context, constraints) {
              const gap = 8.0;
              final width = constraints.maxWidth >= 430
                  ? (constraints.maxWidth - gap) / 2
                  : constraints.maxWidth;

              return Wrap(
                spacing: gap,
                runSpacing: 7,
                children: categories.map((category) {
                  final count = counts[category] ?? 0;
                  final strong = strengths.contains(category);
                  final weak = weakCategories.contains(category);

                  return SizedBox(
                    width: width,
                    child: _AreaLegendRow(
                      category: category,
                      count: count,
                      strong: strong,
                      weak: weak,
                    ),
                  );
                }).toList(),
              );
            },
          ),
          if (strengths.isNotEmpty || weakCategories.isNotEmpty) ...[
            const SizedBox(height: 12),
            Text(
              '★ forte no último Score   ↗ reforçar',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: colors.onSurfaceVariant,
                    fontSize: 9.5,
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ],
        ],
      ),
    );
  }
}

class _AreaLegendRow extends StatelessWidget {
  const _AreaLegendRow({
    required this.category,
    required this.count,
    required this.strong,
    required this.weak,
  });

  final String category;
  final int count;
  final bool strong;
  final bool weak;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 8),
      decoration: BoxDecoration(
        color: strong
            ? colors.primaryContainer.withValues(alpha: .62)
            : Colors.transparent,
        border: Border.all(
          color: strong ? colors.primary.withValues(alpha: .55) : colors.outline,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 18,
            child: Text(
              strong
                  ? '★'
                  : weak
                      ? '↗'
                      : '·',
              style: TextStyle(
                color: strong ? colors.primary : colors.onSurfaceVariant,
                fontSize: 11,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          Expanded(
            child: Text(
              _categoryLabel(category),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                    fontSize: 10.5,
                  ),
            ),
          ),
          const SizedBox(width: 6),
          Text(
            '$count',
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: count > 0 ? colors.primary : colors.onSurfaceVariant,
                  fontWeight: FontWeight.w900,
                ),
          ),
        ],
      ),
    );
  }
}

class _CulturalMapPainter extends CustomPainter {
  _CulturalMapPainter({
    required this.counts,
    required this.maxCount,
    required this.strengths,
    required this.weakCategories,
    required this.primary,
    required this.onSurface,
    required this.muted,
    required this.line,
    required this.soft,
  });

  final Map<String, int> counts;
  final int maxCount;
  final Set<String> strengths;
  final Set<String> weakCategories;
  final Color primary;
  final Color onSurface;
  final Color muted;
  final Color line;
  final Color soft;

  static const _angles = <double>[
    -1.57,
    -0.78,
    -0.10,
    0.72,
    1.55,
    2.37,
    3.05,
    3.84,
  ];

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) * .34;
    final points = <Offset>[];

    for (var i = 0; i < CulturalMap.categories.length; i++) {
      final angle = _angles[i];
      points.add(
        center + Offset(math.cos(angle), math.sin(angle)) * radius,
      );
    }

    final guidePaint = Paint()
      ..color = line.withValues(alpha: .52)
      ..strokeWidth = 1;

    for (final point in points) {
      canvas.drawLine(center, point, guidePaint);
    }

    canvas.drawCircle(
      center,
      radius * .52,
      Paint()
        ..color = line.withValues(alpha: .32)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1,
    );

    canvas.drawCircle(
      center,
      radius,
      Paint()
        ..color = line.withValues(alpha: .22)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1,
    );

    final activePath = Path();
    var activeStarted = false;
    for (var i = 0; i < CulturalMap.categories.length; i++) {
      final category = CulturalMap.categories[i];
      if ((counts[category] ?? 0) <= 0) continue;
      final point = points[i];
      if (!activeStarted) {
        activePath.moveTo(point.dx, point.dy);
        activeStarted = true;
      } else {
        activePath.lineTo(point.dx, point.dy);
      }
    }

    if (activeStarted) {
      canvas.drawPath(
        activePath,
        Paint()
          ..color = primary.withValues(alpha: .42)
          ..strokeWidth = 1.8
          ..strokeCap = StrokeCap.round
          ..strokeJoin = StrokeJoin.round
          ..style = PaintingStyle.stroke,
      );
    }

    canvas.drawCircle(
      center,
      30,
      Paint()..color = soft.withValues(alpha: .9),
    );
    canvas.drawCircle(
      center,
      30,
      Paint()
        ..color = primary.withValues(alpha: .5)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.2,
    );

    final centerPainter = TextPainter(
      text: TextSpan(
        text: 'EU',
        style: TextStyle(
          color: primary,
          fontSize: 11,
          fontWeight: FontWeight.w900,
          letterSpacing: 1.2,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    centerPainter.paint(
      canvas,
      center - Offset(centerPainter.width / 2, centerPainter.height / 2),
    );

    for (var i = 0; i < CulturalMap.categories.length; i++) {
      final category = CulturalMap.categories[i];
      final count = counts[category] ?? 0;
      final progress = (count / maxCount).clamp(0.0, 1.0);
      final strong = strengths.contains(category);
      final weak = weakCategories.contains(category);
      final nodeRadius = count == 0 ? 6.5 : 9 + progress * 12;
      final point = points[i];

      if (strong) {
        canvas.drawCircle(
          point,
          nodeRadius + 7,
          Paint()..color = primary.withValues(alpha: .12),
        );
        canvas.drawCircle(
          point,
          nodeRadius + 5,
          Paint()
            ..color = primary.withValues(alpha: .42)
            ..style = PaintingStyle.stroke
            ..strokeWidth = 1.4,
        );
      }

      canvas.drawCircle(
        point,
        nodeRadius,
        Paint()
          ..color = count > 0
              ? primary.withValues(alpha: .22 + progress * .48)
              : line.withValues(alpha: .4),
      );

      canvas.drawCircle(
        point,
        nodeRadius,
        Paint()
          ..color = count > 0 ? primary : line
          ..style = PaintingStyle.stroke
          ..strokeWidth = count > 0 ? 1.5 : 1,
      );

      if (weak) {
        final arrowPainter = TextPainter(
          text: TextSpan(
            text: '↗',
            style: TextStyle(
              color: muted,
              fontSize: 12,
              fontWeight: FontWeight.w900,
            ),
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        arrowPainter.paint(
          canvas,
          point + Offset(nodeRadius + 3, -nodeRadius - 6),
        );
      }

      final label = _shortLabel(category);
      final labelPainter = TextPainter(
        text: TextSpan(
          text: label,
          style: TextStyle(
            color: count > 0 ? onSurface : muted,
            fontSize: 9.3,
            fontWeight: count > 0 ? FontWeight.w800 : FontWeight.w600,
            height: 1.05,
          ),
        ),
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
        maxLines: 2,
      )..layout(maxWidth: 74);

      final direction = point - center;
      final labelOffset = point +
          Offset(
            direction.dx.sign * (nodeRadius + 11),
            direction.dy.sign * (nodeRadius + 9),
          ) -
          Offset(
            direction.dx.abs() < 10 ? labelPainter.width / 2 : direction.dx < 0 ? labelPainter.width : 0,
            direction.dy.abs() < 10 ? labelPainter.height / 2 : direction.dy < 0 ? labelPainter.height : 0,
          );

      labelPainter.paint(canvas, labelOffset);
    }
  }

  @override
  bool shouldRepaint(covariant _CulturalMapPainter oldDelegate) {
    return oldDelegate.counts != counts ||
        oldDelegate.maxCount != maxCount ||
        oldDelegate.strengths != strengths ||
        oldDelegate.weakCategories != weakCategories ||
        oldDelegate.primary != primary ||
        oldDelegate.onSurface != onSurface ||
        oldDelegate.muted != muted ||
        oldDelegate.line != line ||
        oldDelegate.soft != soft;
  }
}

String _shortLabel(String value) {
  return switch (value) {
    'PSICOLOGIA' => 'Psico',
    'HISTÓRIA' => 'História',
    'CIÊNCIA' => 'Ciência',
    'ECONOMIA' => 'Economia',
    'ARTE & DESIGN' => 'Arte &\ndesign',
    'TECNOLOGIA' => 'Tech',
    'MUNDO' => 'Mundo',
    'CULTURA' => 'Cultura',
    _ => value,
  };
}

String _categoryLabel(String value) {
  return switch (value) {
    'PSICOLOGIA' => 'Psicologia',
    'HISTÓRIA' => 'História',
    'CIÊNCIA' => 'Ciência',
    'ECONOMIA' => 'Economia',
    'ARTE & DESIGN' => 'Arte & design',
    'TECNOLOGIA' => 'Tecnologia',
    'MUNDO' => 'Mundo',
    'CULTURA' => 'Cultura',
    _ => value,
  };
}
