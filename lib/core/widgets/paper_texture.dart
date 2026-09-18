import 'package:flutter/material.dart';

class PaperTexture extends StatelessWidget {
  const PaperTexture({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dark = theme.brightness == Brightness.dark;

    return Stack(
      fit: StackFit.expand,
      children: [
        ColoredBox(
          color: theme.scaffoldBackgroundColor,
          child: child,
        ),
        IgnorePointer(
          child: CustomPaint(
            painter: _PaperTexturePainter(dark: dark),
          ),
        ),
      ],
    );
  }
}

class _PaperTexturePainter extends CustomPainter {
  const _PaperTexturePainter({required this.dark});

  final bool dark;

  @override
  void paint(Canvas canvas, Size size) {
    final grain = Paint()
      ..color = (dark ? Colors.white : const Color(0xFF1A1A1A))
          .withValues(alpha: dark ? .018 : .025);

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
      ..color = (dark ? const Color(0xFF9EA7C0) : const Color(0xFF6C6559))
          .withValues(alpha: dark ? .012 : .018)
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
  bool shouldRepaint(covariant _PaperTexturePainter oldDelegate) =>
      oldDelegate.dark != dark;
}
