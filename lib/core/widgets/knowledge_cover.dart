import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';

enum KnowledgeCoverStyle {
  bauhaus,
  typography,
  archive,
  orbit,
  columns,
  waves,
}

class KnowledgeCover extends StatelessWidget {
  const KnowledgeCover({
    super.key,
    required this.title,
    required this.kicker,
    required this.style,
    this.width = 136,
    this.height = 190,
    this.selected = false,
    this.onTap,
  });

  final String title;
  final String kicker;
  final KnowledgeCoverStyle style;
  final double width;
  final double height;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final cover = AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.paperWhite,
        border: Border.all(
          color: selected ? AppColors.blue : AppColors.ink,
          width: selected ? 3 : 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0x26000000),
            offset: Offset(selected ? 5 : 3, selected ? 6 : 4),
            blurRadius: 0,
          ),
        ],
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          CustomPaint(painter: _CoverPainter(style)),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  kicker.toUpperCase(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontSize: 8,
                        letterSpacing: 1.2,
                        color: style == KnowledgeCoverStyle.archive
                            ? Colors.white70
                            : AppColors.ink,
                      ),
                ),
                const Spacer(),
                Text(
                  title.toUpperCase(),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 17,
                        height: .94,
                        letterSpacing: -.6,
                        color: style == KnowledgeCoverStyle.archive
                            ? Colors.white
                            : AppColors.ink,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    if (onTap == null) {
      return cover;
    }

    return Semantics(
      button: true,
      label: title,
      child: InkWell(
        onTap: onTap,
        child: cover,
      ),
    );
  }
}

class _CoverPainter extends CustomPainter {
  const _CoverPainter(this.style);

  final KnowledgeCoverStyle style;

  @override
  void paint(Canvas canvas, Size size) {
    final ink = Paint()..color = AppColors.ink;
    final blue = Paint()..color = AppColors.blue;
    final line = Paint()
      ..color = AppColors.ink
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;

    switch (style) {
      case KnowledgeCoverStyle.bauhaus:
        canvas.drawCircle(
          Offset(size.width * .32, size.height * .42),
          size.width * .18,
          blue,
        );
        canvas.drawRect(
          Rect.fromLTWH(
            size.width * .53,
            size.height * .14,
            size.width * .12,
            size.height * .48,
          ),
          ink,
        );
        for (var i = 0; i < 5; i++) {
          final x = size.width * (.70 + i * .045);
          canvas.drawLine(
            Offset(x, size.height * .35),
            Offset(x, size.height * .63),
            line,
          );
        }
        break;
      case KnowledgeCoverStyle.typography:
        canvas.drawRect(
          Rect.fromLTWH(
            size.width * .12,
            size.height * .22,
            size.width * .76,
            size.height * .12,
          ),
          blue,
        );
        canvas.drawLine(
          Offset(size.width * .12, size.height * .42),
          Offset(size.width * .88, size.height * .42),
          line..strokeWidth = 4,
        );
        canvas.drawLine(
          Offset(size.width * .12, size.height * .49),
          Offset(size.width * .70, size.height * .49),
          line..strokeWidth = 2,
        );
        break;
      case KnowledgeCoverStyle.archive:
        canvas.drawRect(Offset.zero & size, Paint()..color = AppColors.deepBlue);
        final whiteLine = Paint()
          ..color = Colors.white70
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1;
        for (var i = 0; i < 5; i++) {
          final inset = 12.0 + i * 8;
          canvas.drawRect(
            Rect.fromLTWH(
              inset,
              size.height * .16 + i * 2,
              size.width - inset * 2,
              size.height * .34,
            ),
            whiteLine,
          );
        }
        break;
      case KnowledgeCoverStyle.orbit:
        canvas.drawCircle(
          Offset(size.width * .5, size.height * .36),
          size.width * .13,
          blue,
        );
        canvas.drawOval(
          Rect.fromCenter(
            center: Offset(size.width * .5, size.height * .36),
            width: size.width * .64,
            height: size.width * .28,
          ),
          line,
        );
        canvas.drawOval(
          Rect.fromCenter(
            center: Offset(size.width * .5, size.height * .36),
            width: size.width * .42,
            height: size.width * .62,
          ),
          line,
        );
        break;
      case KnowledgeCoverStyle.columns:
        for (var i = 0; i < 5; i++) {
          final x = size.width * (.13 + i * .17);
          canvas.drawRect(
            Rect.fromLTWH(
              x,
              size.height * .19,
              size.width * .075,
              size.height * .35,
            ),
            i == 2 ? blue : ink,
          );
        }
        break;
      case KnowledgeCoverStyle.waves:
        final wave = Paint()
          ..color = AppColors.blue
          ..style = PaintingStyle.stroke
          ..strokeWidth = 8
          ..strokeCap = StrokeCap.round;
        for (var i = 0; i < 3; i++) {
          final y = size.height * (.24 + i * .11);
          final path = Path()
            ..moveTo(size.width * .12, y)
            ..cubicTo(
              size.width * .35,
              y - 18,
              size.width * .58,
              y + 18,
              size.width * .86,
              y,
            );
          canvas.drawPath(path, wave);
        }
        break;
    }
  }

  @override
  bool shouldRepaint(covariant _CoverPainter oldDelegate) =>
      oldDelegate.style != style;
}
