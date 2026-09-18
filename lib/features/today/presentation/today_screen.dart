import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../../core/widgets/editorial_decorations.dart';
import '../../../core/widgets/editorial_frame.dart';
import '../../../core/widgets/editorial_rule.dart';
import '../../../core/widgets/paper_texture.dart';
import '../../article/presentation/article_screen.dart';
import '../data/demo_topics.dart';

class TodayScreen extends StatelessWidget {
  const TodayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PaperTexture(
      child: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: EditorialFrame(
            maxWidth: 760,
            padding: const EdgeInsets.fromLTRB(20, 22, 20, 36),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _TopBar(),
                const SizedBox(height: 34),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Text(
                        bauhausTopic.eyebrow,
                        style:
                            Theme.of(context).textTheme.labelLarge?.copyWith(
                                  color: AppColors.blue,
                                  letterSpacing: 1.5,
                                ),
                      ),
                    ),
                    const DoodleAsterisk(size: 24),
                  ],
                ),
                const SizedBox(height: 10),
                const EditorialRule(width: 66),
                const SizedBox(height: 18),
                _HeroCard(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (_) => const ArticleScreen(topic: bauhausTopic),
                    ),
                  ),
                ),
                const SizedBox(height: 38),
                const _SectionHeading(
                  title: 'rapidinhas',
                  counter: '01—04',
                ),
                const SizedBox(height: 12),
                ...quickTopics.indexed.map(
                  (item) => _QuickRow(
                    number: (item.$1 + 1).toString().padLeft(2, '0'),
                    title: item.$2,
                  ),
                ),
                const SizedBox(height: 38),
                const _DiscoveryStrip(),
                const SizedBox(height: 20),
                const _RabbitHoleCard(),
                const SizedBox(height: 30),
                const _FooterNote(),
              ],
            ),
          ),
        ),
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
                fontWeight: FontWeight.w800,
              ),
        ),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'EDIÇÃO DIÁRIA',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontSize: 10,
                    letterSpacing: 1.25,
                    color: AppColors.muted,
                  ),
            ),
            const SizedBox(height: 3),
            Text(
              '17 · SET',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
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
    return LayoutBuilder(
      builder: (context, constraints) {
        final wide = constraints.maxWidth >= 620;

        return Stack(
          clipBehavior: Clip.none,
          children: [
            InkWell(
              onTap: onTap,
              child: Ink(
                decoration: BoxDecoration(
                  color: AppColors.paperWhite,
                  border: Border.all(color: AppColors.ink, width: 1.2),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x19000000),
                      offset: Offset(4, 5),
                      blurRadius: 0,
                    ),
                  ],
                ),
                child: wide
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Expanded(
                            flex: 5,
                            child: _BauhausArtwork(),
                          ),
                          Expanded(
                            flex: 6,
                            child: _HeroCopy(wide: true),
                          ),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const AspectRatio(
                            aspectRatio: 1.38,
                            child: _BauhausArtwork(),
                          ),
                          const _HeroCopy(wide: false),
                        ],
                      ),
              ),
            ),
            const Positioned(
              top: -10,
              left: 34,
              child: PaperTape(width: 88, height: 19),
            ),
            Positioned(
              top: wide ? 38 : 20,
              right: wide ? null : -7,
              left: wide ? constraints.maxWidth * .39 : null,
              child: Transform.rotate(
                angle: .07,
                child: const DecoratedBox(
                  decoration: BoxDecoration(color: AppColors.paper),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 5,
                    ),
                    child: HandNote(
                      'comece por aqui →',
                      fontSize: 19,
                      color: AppColors.ink,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _HeroCopy extends StatelessWidget {
  const _HeroCopy({required this.wide});

  final bool wide;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        wide ? 24 : 18,
        wide ? 34 : 18,
        wide ? 24 : 18,
        wide ? 26 : 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'DESIGN / HISTÓRIA',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: AppColors.blue,
                  fontSize: 10,
                  letterSpacing: 1.2,
                ),
          ),
          const SizedBox(height: 10),
          Text(
            bauhausTopic.title,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontSize: wide ? 44 : 43,
                  fontWeight: FontWeight.w500,
                ),
          ),
          const SizedBox(height: 14),
          Text(
            bauhausTopic.summary,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Text(
                '6 min de leitura',
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
    );
  }
}

class _BauhausArtwork extends StatelessWidget {
  const _BauhausArtwork();

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.paper,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CustomPaint(painter: _BauhausPainter()),
          const Positioned(
            left: 18,
            top: 16,
            child: Text(
              'BAUHAUS',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.2,
              ),
            ),
          ),
          const Positioned(
            right: 16,
            bottom: 14,
            child: Text(
              '1919—1933',
              style: TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.w700,
                letterSpacing: 1,
              ),
            ),
          ),
          const Positioned(
            left: 15,
            bottom: 18,
            child: DoodleAsterisk(
              size: 24,
              color: AppColors.ink,
            ),
          ),
        ],
      ),
    );
  }
}

class _BauhausPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final blue = Paint()..color = AppColors.blue;
    final ink = Paint()..color = AppColors.ink;
    final paperWhite = Paint()..color = AppColors.paperWhite;

    canvas.drawCircle(
      Offset(size.width * .34, size.height * .46),
      size.shortestSide * .22,
      blue,
    );

    canvas.drawRect(
      Rect.fromLTWH(
        size.width * .47,
        size.height * .11,
        size.width * .105,
        size.height * .69,
      ),
      ink,
    );

    canvas.drawRect(
      Rect.fromLTWH(
        size.width * .18,
        size.height * .60,
        size.width * .48,
        size.height * .10,
      ),
      paperWhite,
    );

    final line = Paint()
      ..color = AppColors.ink
      ..strokeWidth = 1.8;

    for (var i = 0; i < 7; i++) {
      final x = size.width * (.66 + i * .032);
      canvas.drawLine(
        Offset(x, size.height * .43),
        Offset(x, size.height * .86),
        line,
      );
    }

    canvas.drawLine(
      Offset(size.width * .07, size.height * .84),
      Offset(size.width * .39, size.height * .84),
      line..strokeWidth = 4,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _SectionHeading extends StatelessWidget {
  const _SectionHeading({
    required this.title,
    required this.counter,
  });

  final String title;
  final String counter;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DoodleUnderline(
          child: Text(
            title,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        const Spacer(),
        Text(
          counter,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: AppColors.muted,
              ),
        ),
      ],
    );
  }
}

class _QuickRow extends StatelessWidget {
  const _QuickRow({required this.number, required this.title});

  final String number;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: AppColors.line)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 42,
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
              const SizedBox(width: 8),
              const Icon(Icons.north_east, size: 18),
            ],
          ),
        ),
      ),
    );
  }
}

class _DiscoveryStrip extends StatelessWidget {
  const _DiscoveryStrip();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 13),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: AppColors.ink),
          bottom: BorderSide(color: AppColors.ink),
        ),
      ),
      child: Row(
        children: [
          const DoodleArrow(width: 60, height: 30),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              'uma ideia puxa outra',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 16,
                  ),
            ),
          ),
          const HandNote('rabbit hole', fontSize: 20),
        ],
      ),
    );
  }
}

class _RabbitHoleCard extends StatelessWidget {
  const _RabbitHoleCard();

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(22, 26, 22, 22),
          decoration: const BoxDecoration(
            color: AppColors.deepBlue,
          ),
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
              const SizedBox(height: 22),
              Text(
                'Bauhaus → modernismo → Brasília → Niemeyer',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: Colors.white,
                      fontSize: 39,
                      height: 1.04,
                    ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Text(
                    '4 conexões',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Colors.white70,
                        ),
                  ),
                  const Spacer(),
                  const Icon(Icons.arrow_forward, color: Colors.white),
                ],
              ),
            ],
          ),
        ),
        const Positioned(
          top: -10,
          right: 30,
          child: PaperTape(
            width: 76,
            height: 20,
            angle: .07,
          ),
        ),
      ],
    );
  }
}

class _FooterNote extends StatelessWidget {
  const _FooterNote();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Transform.rotate(
        angle: -.025,
        child: const HandNote(
          'curiosidade também é hábito.',
          fontSize: 22,
          color: AppColors.muted,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
