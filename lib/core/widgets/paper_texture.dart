import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';

class PaperTexture extends StatelessWidget {
  const PaperTexture({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        ColoredBox(
          color: AppColors.paper,
          child: child,
        ),
        const IgnorePointer(
          child: CustomPaint(
            painter: _PaperTexturePainter(),
          ),
        ),
      ],
    );
  }
}

class _PaperTexturePainter extends CustomPainter {
  const _PaperTexturePainter();

  @override
  void paint(Canvas canvas, Size size) {
    final grain = Paint()
      ..color = const Color(0xFF1A1A1A).withValues(alpha: .025);

    for (var y = 7.0; y < size.height; y += 17) {
      for (var x = 11.0; x < size.width; x += 23) {
        final shift = ((x + y).round() % 7).toDouble();
        canvas.drawCircle(
          Offset(x + shift, y - shift * .35),
          .55,
          grain,
        );
      }
    }

    final fibers = Paint()
      ..color = const Color(0xFF6C6559).withValues(alpha: .018)
      ..strokeWidth = .6;

    for (var y = 14.0; y < size.height; y += 37) {
      canvas.drawLine(
        Offset(0, y),
        Offset(size.width, y + 1.5),
        fibers,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
