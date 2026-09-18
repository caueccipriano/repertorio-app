import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';

enum KnowledgeCoverStyle {
  bauhaus,
  typography,
  archive,
  orbit,
  columns,
  waves,
  diagonal,
  constellation,
  stamp,
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
    this.onLongPress,
  });

  final String title;
  final String kicker;
  final KnowledgeCoverStyle style;
  final double width;
  final double height;
  final bool selected;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  bool get _darkCover => style == KnowledgeCoverStyle.archive;

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
                        color: _darkCover ? Colors.white70 : AppColors.ink,
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
                        color: _darkCover ? Colors.white : AppColors.ink,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    if (onTap == null && onLongPress == null) {
      return cover;
    }

    return Semantics(
      button: true,
      label: title,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          onLongPress: onLongPress,
          child: cover,
        ),
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
        canvas.drawRect(
          Offset.zero & size,
          Paint()..color = AppColors.deepBlue,
        );
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
      case KnowledgeCoverStyle.diagonal:
        final path = Path()
          ..moveTo(0, size.height * .18)
          ..lineTo(size.width, size.height * .03)
          ..lineTo(size.width, size.height * .28)
          ..lineTo(0, size.height * .43)
          ..close();
        canvas.drawPath(path, blue);
        canvas.drawLine(
          Offset(size.width * .12, size.height * .52),
          Offset(size.width * .88, size.height * .40),
          line..strokeWidth = 3,
        );
        canvas.drawLine(
          Offset(size.width * .18, size.height * .59),
          Offset(size.width * .75, size.height * .50),
          line..strokeWidth = 1.3,
        );
        break;
      case KnowledgeCoverStyle.constellation:
        final star = Paint()..color = AppColors.blue;
        final connector = Paint()
          ..color = AppColors.ink
          ..strokeWidth = .9;
        final points = <Offset>[
          Offset(size.width * .20, size.height * .24),
          Offset(size.width * .47, size.height * .17),
          Offset(size.width * .75, size.height * .30),
          Offset(size.width * .62, size.height * .46),
          Offset(size.width * .30, size.height * .50),
        ];
        for (var i = 0; i < points.length - 1; i++) {
          canvas.drawLine(points[i], points[i + 1], connector);
        }
        for (final point in points) {
          canvas.drawCircle(point, size.width * .028, star);
        }
        break;
      case KnowledgeCoverStyle.stamp:
        canvas.drawRect(
          Rect.fromLTWH(
            size.width * .13,
            size.height * .18,
            size.width * .74,
            size.height * .29,
          ),
          blue,
        );
        final paper = Paint()..color = AppColors.paperWhite;
        canvas.drawRect(
          Rect.fromLTWH(
            size.width * .19,
            size.height * .24,
            size.width * .62,
            size.height * .17,
          ),
          paper,
        );
        for (var i = 0; i < 8; i++) {
          final y = size.height * (.51 + i * .018);
          canvas.drawLine(
            Offset(size.width * .18, y),
            Offset(size.width * (.78 - (i % 3) * .08), y),
            line..strokeWidth = i == 0 ? 2 : .8,
          );
        }
        break;
    }
  }

  @override
  bool shouldRepaint(covariant _CoverPainter oldDelegate) =>
      oldDelegate.style != style;
}
