import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../app/theme/app_colors.dart';

class PaperTape extends StatelessWidget {
  const PaperTape({
    super.key,
    this.width = 72,
    this.height = 20,
    this.angle = -.08,
  });

  final double width;
  final double height;
  final double angle;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: const Color(0xFFD9C9A7).withValues(alpha: .54),
          border: Border.all(
            color: const Color(0xFFC2AF89).withValues(alpha: .42),
          ),
        ),
      ),
    );
  }
}

class HandNote extends StatelessWidget {
  const HandNote(
    this.text, {
    super.key,
    this.color = AppColors.blue,
    this.fontSize = 20,
    this.textAlign = TextAlign.left,
  });

  final String text;
  final Color color;
  final double fontSize;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.caveat(
        color: color,
        fontSize: fontSize,
        height: 1,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class DoodleArrow extends StatelessWidget {
  const DoodleArrow({
    super.key,
    this.width = 72,
    this.height = 34,
    this.color = AppColors.ink,
    this.flip = false,
  });

  final double width;
  final double height;
  final Color color;
  final bool flip;

  @override
  Widget build(BuildContext context) {
    final child = CustomPaint(
      size: Size(width, height),
      painter: _DoodleArrowPainter(color),
    );

    if (!flip) {
      return child;
    }

    return Transform.flip(
      flipX: true,
      child: child,
    );
  }
}

class _DoodleArrowPainter extends CustomPainter {
  _DoodleArrowPainter(this.color);

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.2
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final path = Path()
      ..moveTo(2, size.height * .74)
      ..cubicTo(
        size.width * .24,
        size.height * .26,
        size.width * .62,
        size.height * .92,
        size.width - 8,
        size.height * .30,
      );

    canvas.drawPath(path, paint);
    canvas.drawLine(
      Offset(size.width - 9, size.height * .30),
      Offset(size.width - 18, size.height * .31),
      paint,
    );
    canvas.drawLine(
      Offset(size.width - 9, size.height * .30),
      Offset(size.width - 12, size.height * .56),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant _DoodleArrowPainter oldDelegate) =>
      oldDelegate.color != color;
}

class DoodleAsterisk extends StatelessWidget {
  const DoodleAsterisk({
    super.key,
    this.size = 28,
    this.color = AppColors.blue,
  });

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.square(size),
      painter: _AsteriskPainter(color),
    );
  }
}

class _AsteriskPainter extends CustomPainter {
  _AsteriskPainter(this.color);

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2.4
      ..strokeCap = StrokeCap.round;

    final center = Offset(size.width / 2, size.height / 2);
    final r = size.shortestSide * .42;

    for (var i = 0; i < 4; i++) {
      final angle = i * math.pi / 4;
      final dx = r * math.cos(angle);
      final dy = r * math.sin(angle);

      canvas.drawLine(
        Offset(center.dx - dx, center.dy - dy),
        Offset(center.dx + dx, center.dy + dy),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _AsteriskPainter oldDelegate) =>
      oldDelegate.color != color;
}

class DoodleUnderline extends StatelessWidget {
  const DoodleUnderline({
    super.key,
    required this.child,
    this.color = AppColors.blue,
  });

  final Widget child;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        child,
        Positioned(
          left: 0,
          right: 0,
          bottom: -4,
          child: SizedBox(
            height: 8,
            child: CustomPaint(
              painter: _UnderlinePainter(color),
            ),
          ),
        ),
      ],
    );
  }
}

class _UnderlinePainter extends CustomPainter {
  _UnderlinePainter(this.color);

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    final path = Path()
      ..moveTo(1, 4)
      ..quadraticBezierTo(size.width * .22, 1, size.width * .45, 4)
      ..quadraticBezierTo(size.width * .72, 7, size.width - 1, 3);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _UnderlinePainter oldDelegate) =>
      oldDelegate.color != color;
}
