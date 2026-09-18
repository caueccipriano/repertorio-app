import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../../core/widgets/editorial_rule.dart';
import '../../article/presentation/article_screen.dart';
import '../data/demo_topics.dart';

class TodayScreen extends StatelessWidget {
  const TodayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 22, 20, 28),
            sliver: SliverList.list(
              children: [
                const _TopBar(),
                const SizedBox(height: 34),
                Text(
                  bauhausTopic.eyebrow,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: AppColors.blue,
                        letterSpacing: 1.5,
                      ),
                ),
                const SizedBox(height: 10),
                const EditorialRule(),
                const SizedBox(height: 18),
                _HeroCard(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (_) => const ArticleScreen(topic: bauhausTopic),
                    ),
                  ),
                ),
                const SizedBox(height: 34),
                Row(
                  children: [
                    Text(
                      'rapidinhas',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const Spacer(),
                    Text(
                      '01—04',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: AppColors.muted,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ...quickTopics.indexed.map(
                  (item) => _QuickRow(
                    number: (item.$1 + 1).toString().padLeft(2, '0'),
                    title: item.$2,
                  ),
                ),
                const SizedBox(height: 34),
                const _RabbitHoleCard(),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'repertório*',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: AppColors.blue,
                letterSpacing: -1,
              ),
        ),
        const Spacer(),
        Text(
          '17 · SET',
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: AppColors.muted,
              ),
        ),
      ],
    );
  }
}

class _HeroCard extends StatelessWidget {
  const _HeroCard({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(2),
      onTap: onTap,
      child: Ink(
        decoration: BoxDecoration(
          color: AppColors.paperWhite,
          border: Border.all(color: AppColors.ink, width: 1.2),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AspectRatio(
              aspectRatio: 1.45,
              child: _BauhausArtwork(),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 18, 18, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bauhausTopic.title,
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    bauhausTopic.summary,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 18),
                  Row(
                    children: [
                      Text(
                        '6 min · design · história',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: AppColors.blue,
                            ),
                      ),
                      const Spacer(),
                      const Icon(Icons.arrow_forward, size: 20),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BauhausArtwork extends StatelessWidget {
  const _BauhausArtwork();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _BauhausPainter(),
      child: Align(
        alignment: const Alignment(.72, -.58),
        child: Transform.rotate(
          angle: -.06,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
            color: AppColors.paper,
            child: Text(
              'você vê isso\ntodos os dias →',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontStyle: FontStyle.italic,
                    height: 1.1,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}

class _BauhausPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final blue = Paint()..color = AppColors.blue;
    final ink = Paint()..color = AppColors.ink;
    final paper = Paint()..color = AppColors.paper;

    canvas.drawRect(Offset.zero & size, paper);
    canvas.drawCircle(
      Offset(size.width * .28, size.height * .46),
      size.height * .24,
      blue,
    );
    canvas.drawRect(
      Rect.fromLTWH(
        size.width * .46,
        size.height * .13,
        size.width * .11,
        size.height * .72,
      ),
      ink,
    );

    final line = Paint()
      ..color = AppColors.ink
      ..strokeWidth = 2;

    for (var i = 0; i < 7; i++) {
      final x = size.width * (.64 + i * .035);
      canvas.drawLine(
        Offset(x, size.height * .48),
        Offset(x, size.height * .88),
        line,
      );
    }

    canvas.drawRect(
      Rect.fromLTWH(size.width * .06, size.height * .78, size.width * .28, 4),
      ink,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _QuickRow extends StatelessWidget {
  const _QuickRow({required this.number, required this.title});

  final String number;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.line)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 40,
            child: Text(
              number,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: AppColors.blue,
                  ),
            ),
          ),
          Expanded(
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const Icon(Icons.north_east, size: 18),
        ],
      ),
    );
  }
}

class _RabbitHoleCard extends StatelessWidget {
  const _RabbitHoleCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      color: AppColors.deepBlue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'CONTINUE SEU RABBIT HOLE',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: Colors.white70,
                  letterSpacing: 1.2,
                ),
          ),
          const SizedBox(height: 26),
          Text(
            'Bauhaus → modernismo → Brasília → Niemeyer',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: Colors.white,
                ),
          ),
          const SizedBox(height: 20),
          const Align(
            alignment: Alignment.centerRight,
            child: Icon(Icons.arrow_forward, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
