import 'package:flutter/material.dart';
import '../../../app/state/app_state_scope.dart';
import '../../../app/theme/app_colors.dart';
import '../../../core/widgets/editorial_decorations.dart';
import '../../../core/widgets/editorial_frame.dart';
import '../../../core/widgets/paper_texture.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _controller = PageController();
  int _page = 0;

  static const _pages = [
    _OnboardingPageData(
      kicker: 'REPERTÓRIO / 001',
      title: 'saiba um pouco\nsobre tudo.',
      body:
          'Conhecimento curto, bem contado e conectado para você entender melhor o mundo — e ter sempre algo interessante para conversar.',
      note: 'não é aula.\né repertório.',
      motif: _Motif.circle,
    ),
    _OnboardingPageData(
      kicker: 'REPERTÓRIO / 002',
      title: 'uma ideia\npuxa outra.',
      body:
          'História vira arquitetura. Arquitetura vira política. Política vira cinema. Você segue as conexões que despertam curiosidade.',
      note: 'siga o fio →',
      motif: _Motif.lines,
    ),
    _OnboardingPageData(
      kicker: 'REPERTÓRIO / 003',
      title: 'aprenda para\nlembrar.',
      body:
          'Resumos, pontos essenciais, curiosidades e revisões rápidas ajudam o conteúdo a ficar — em vez de sumir no próximo scroll.',
      note: '5 min já contam.',
      motif: _Motif.grid,
    ),
  ];

  Future<void> _enterApp() async {
    await AppStateScope.read(context).completeOnboarding();
  }

  Future<void> _next() async {
    if (_page == _pages.length - 1) {
      _enterApp();
      return;
    }

    await _controller.nextPage(
      duration: const Duration(milliseconds: 420),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLast = _page == _pages.length - 1;

    return Scaffold(
      body: PaperTexture(
        child: SafeArea(
          child: EditorialFrame(
            maxWidth: 680,
            padding: const EdgeInsets.fromLTRB(20, 18, 20, 22),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'repertório*',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: AppColors.blue,
                            fontWeight: FontWeight.w800,
                            letterSpacing: -.7,
                          ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: _enterApp,
                      child: const Text('pular'),
                    ),
                  ],
                ),
                Expanded(
                  child: PageView.builder(
                    controller: _controller,
                    itemCount: _pages.length,
                    onPageChanged: (value) => setState(() => _page = value),
                    itemBuilder: (context, index) {
                      return _OnboardingPage(data: _pages[index]);
                    },
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    ...List.generate(
                      _pages.length,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 220),
                        margin: const EdgeInsets.only(right: 7),
                        width: index == _page ? 28 : 7,
                        height: 7,
                        decoration: BoxDecoration(
                          color: index == _page
                              ? AppColors.blue
                              : AppColors.line,
                          borderRadius: BorderRadius.circular(99),
                        ),
                      ),
                    ),
                    const Spacer(),
                    FilledButton(
                      onPressed: _next,
                      style: FilledButton.styleFrom(
                        backgroundColor: AppColors.ink,
                        foregroundColor: AppColors.paperWhite,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 16,
                        ),
                        shape: const StadiumBorder(),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(isLast ? 'entrar' : 'continuar'),
                          const SizedBox(width: 10),
                          const Icon(Icons.arrow_forward, size: 18),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _OnboardingPage extends StatelessWidget {
  const _OnboardingPage({required this.data});

  final _OnboardingPageData data;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final compact = constraints.maxHeight < 600;

        return Stack(
          children: [
            Positioned(
              top: compact ? 26 : 58,
              right: 0,
              child: _MotifArtwork(motif: data.motif),
            ),
            Positioned.fill(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                  top: compact ? 26 : 64,
                  bottom: compact ? 16 : 42,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.kicker,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: AppColors.blue,
                            letterSpacing: 1.5,
                          ),
                    ),
                    SizedBox(height: compact ? 14 : 24),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 560),
                      child: Text(
                        data.title,
                        style:
                            Theme.of(context).textTheme.displayLarge?.copyWith(
                                  fontSize: compact ? 48 : 72,
                                  letterSpacing: -2.6,
                                ),
                      ),
                    ),
                    SizedBox(height: compact ? 16 : 30),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 500),
                      child: Text(
                        data.body,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontSize: compact ? 14 : 17,
                            ),
                      ),
                    ),
                    SizedBox(height: compact ? 18 : 38),
                    Transform.rotate(
                      angle: -.035,
                      child: DecoratedBox(
                        decoration: const BoxDecoration(
                          color: AppColors.paperWhite,
                          border: Border(
                            bottom: BorderSide(
                              color: AppColors.ink,
                              width: 1.2,
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(12, 9, 12, 8),
                          child: HandNote(
                            data.note,
                            fontSize: compact ? 19 : 24,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

enum _Motif { circle, lines, grid }

class _MotifArtwork extends StatelessWidget {
  const _MotifArtwork({required this.motif});

  final _Motif motif;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 128,
      height: 128,
      child: CustomPaint(
        painter: _MotifPainter(motif),
      ),
    );
  }
}

class _MotifPainter extends CustomPainter {
  const _MotifPainter(this.motif);

  final _Motif motif;

  @override
  void paint(Canvas canvas, Size size) {
    final blue = Paint()
      ..color = AppColors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    final ink = Paint()
      ..color = AppColors.ink
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;

    switch (motif) {
      case _Motif.circle:
        canvas.drawCircle(
          Offset(size.width * .5, size.height * .5),
          size.width * .32,
          blue..style = PaintingStyle.fill,
        );
        canvas.drawCircle(
          Offset(size.width * .48, size.height * .5),
          size.width * .43,
          ink,
        );
        break;
      case _Motif.lines:
        for (var i = 0; i < 8; i++) {
          final y = 12 + i * 13.0;
          canvas.drawLine(
            Offset(8, y),
            Offset(size.width - (i.isEven ? 8 : 26), y + 8),
            i == 3 ? blue : ink,
          );
        }
        break;
      case _Motif.grid:
        for (var i = 0; i <= 5; i++) {
          final p = 12 + i * 20.0;
          canvas.drawLine(Offset(p, 10), Offset(p, size.height - 10), ink);
          canvas.drawLine(Offset(10, p), Offset(size.width - 10, p), ink);
        }
        canvas.drawCircle(
          Offset(size.width * .66, size.height * .35),
          22,
          blue..style = PaintingStyle.fill,
        );
        break;
    }
  }

  @override
  bool shouldRepaint(covariant _MotifPainter oldDelegate) =>
      oldDelegate.motif != motif;
}

class _OnboardingPageData {
  const _OnboardingPageData({
    required this.kicker,
    required this.title,
    required this.body,
    required this.note,
    required this.motif,
  });

  final String kicker;
  final String title;
  final String body;
  final String note;
  final _Motif motif;
}
