import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../app/app_shell.dart';
import '../data/viral_score_content.dart';
import 'viral_palette.dart';
import 'viral_theme_toggle.dart';
import '../../../core/share/knowledge_card_share.dart';
import '../../../core/widgets/paper_texture.dart';
import 'shared_score_landing.dart';

class ViralEntryGate extends StatefulWidget {
  const ViralEntryGate({super.key});

  @override
  State<ViralEntryGate> createState() => _ViralEntryGateState();
}

class _ViralEntryGateState extends State<ViralEntryGate> {
  static const _entryKey = 'viral_entry_complete_v1';
  static const _scoreKey = 'viral_score_v1';
  static const _archetypeKey = 'viral_archetype_v1';

  bool? _entryComplete;
  int? _sharedScore;
  String? _sharedArchetype;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    final rawScore = int.tryParse(Uri.base.queryParameters['score'] ?? '');
    final sharedScore =
        rawScore != null && rawScore >= 390 && rawScore <= 830 ? rawScore : null;
    final sharedArchetype = Uri.base.queryParameters['a']?.trim();

    if (!mounted) return;
    setState(() {
      _entryComplete = prefs.getBool(_entryKey) ?? false;
      _sharedScore = sharedScore;
      _sharedArchetype =
          sharedArchetype == null || sharedArchetype.isEmpty ? null : sharedArchetype;
    });
  }

  void _startFromSharedScore() {
    setState(() {
      _sharedScore = null;
      _sharedArchetype = null;
      _entryComplete = false;
    });
  }

  Future<void> _enterApp([ViralScoreResult? result]) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_entryKey, true);
    if (result != null) {
      await prefs.setInt(_scoreKey, result.score);
      await prefs.setString(_archetypeKey, result.archetype);
    }
    if (!mounted) return;
    setState(() => _entryComplete = true);
  }

  @override
  Widget build(BuildContext context) {
    final palette = ViralPalette.of(context);
    if (_entryComplete == null) {
      return Scaffold(
        backgroundColor: palette.background,
        body: Center(
          child: Text(
            'repertório*',
            style: TextStyle(
              color: palette.accent,
              fontSize: 24,
              fontWeight: FontWeight.w900,
              letterSpacing: -1,
            ),
          ),
        ),
      );
    }
    if (_sharedScore != null) {
      return SharedScoreLanding(
        score: _sharedScore!,
        archetype: _sharedArchetype,
        onStart: _startFromSharedScore,
        onEnterApp: () => _enterApp(null),
      );
    }
    if (_entryComplete!) return const AppShell();
    return ViralEntryExperience(onEnterApp: _enterApp);
  }
}

class ViralEntryExperience extends StatefulWidget {
  const ViralEntryExperience({super.key, required this.onEnterApp});

  final Future<void> Function(ViralScoreResult? result) onEnterApp;

  @override
  State<ViralEntryExperience> createState() => _ViralEntryExperienceState();
}

class _ViralEntryExperienceState extends State<ViralEntryExperience> {
  int _stage = 0;
  static const _historyKey = 'viral_score_history_v1';

  int _questionIndex = 0;
  int? _previousScore;
  final List<int> _answers = [];

  late List<ViralScoreQuestion> _questions;

  @override
  void initState() {
    super.initState();
    _questions = buildViralRound(
      seed: DateTime.now().microsecondsSinceEpoch,
    );
    _loadPreviousScore();
  }

  Future<void> _loadPreviousScore() async {
    final prefs = await SharedPreferences.getInstance();
    final history = prefs.getStringList(_historyKey) ?? const <String>[];
    if (history.isEmpty || !mounted) return;
    final score = int.tryParse(history.first.split('|').first);
    if (score == null) return;
    setState(() => _previousScore = score);
  }

  Future<void> _finishQuiz() async {
    final prefs = await SharedPreferences.getInstance();
    final history = prefs.getStringList(_historyKey) ?? <String>[];
    final result = _result;
    final previous = history.isEmpty
        ? _previousScore
        : int.tryParse(history.first.split('|').first);

    final entry =
        '${result.score}|${DateTime.now().toIso8601String()}|${result.archetype}';
    final nextHistory = <String>[entry, ...history].take(5).toList();
    await prefs.setStringList(_historyKey, nextHistory);

    if (!mounted) return;
    setState(() {
      _previousScore = previous;
      _stage = 2;
    });
  }

  void _start() {
    setState(() {
      _questions = buildViralRound(
        seed: DateTime.now().microsecondsSinceEpoch,
      );
      _stage = 1;
      _questionIndex = 0;
      _answers.clear();
    });
  }

  void _answer(int answerIndex) {
    if (_answers.length > _questionIndex) return;
    setState(() => _answers.add(answerIndex));

    Future<void>.delayed(const Duration(milliseconds: 460), () {
      if (!mounted) return;
      if (_questionIndex == _questions.length - 1) {
        _finishQuiz();
      } else {
        setState(() => _questionIndex++);
      }
    });
  }

  ViralScoreResult get _result {
    var correct = 0;
    final hitsByCategory = <String, int>{};

    for (var i = 0; i < _answers.length && i < _questions.length; i++) {
      if (_answers[i] == _questions[i].correctIndex) {
        correct++;
        hitsByCategory.update(
          _questions[i].category,
          (value) => value + 1,
          ifAbsent: () => 1,
        );
      }
    }

    final ratio = _questions.isEmpty ? 0.0 : correct / _questions.length;
    final score = 390 + (ratio * 440).round();

    final rankedStrengths = hitsByCategory.entries.toList()
      ..sort((a, b) {
        final byHits = b.value.compareTo(a.value);
        return byHits != 0 ? byHits : a.key.compareTo(b.key);
      });

    final profile = resolveViralProfile(
      score: score,
      breadth: hitsByCategory.length,
    );

    return ViralScoreResult(
      score: score,
      correct: correct,
      total: _questions.length,
      archetype: profile.archetype,
      description: profile.description,
      strengths: rankedStrengths.take(3).map((entry) => entry.key).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PaperTexture(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 380),
            reverseDuration: const Duration(milliseconds: 260),
            switchInCurve: Curves.easeOutCubic,
            switchOutCurve: Curves.easeInCubic,
            transitionBuilder: (child, animation) {
              final slide = Tween<Offset>(
                begin: const Offset(.035, .015),
                end: Offset.zero,
              ).animate(animation);
              return FadeTransition(
                opacity: animation,
                child: SlideTransition(position: slide, child: child),
              );
            },
            child: switch (_stage) {
              0 => _LandingStage(
                  key: const ValueKey('landing'),
                  onStart: _start,
                  onSkip: () => widget.onEnterApp(null),
                ),
              1 => _QuizStage(
                  key: ValueKey('quiz-$_questionIndex'),
                  question: _questions[_questionIndex],
                  index: _questionIndex,
                  total: _questions.length,
                  selectedAnswer: _answers.length > _questionIndex
                      ? _answers[_questionIndex]
                      : null,
                  onAnswer: _answer,
                  onBack: () {
                    setState(() {
                      if (_questionIndex == 0) {
                        _stage = 0;
                        _answers.clear();
                      } else {
                        _questionIndex--;
                        if (_answers.isNotEmpty) _answers.removeLast();
                      }
                    });
                  },
                ),
              _ => _ResultStage(
                  key: const ValueKey('result'),
                  result: _result,
                  previousScore: _previousScore,
                  onEnterApp: () => widget.onEnterApp(_result),
                  onRestart: _start,
                ),
            },
          ),
        ),
      ),
    );
  }
}

class _LandingStage extends StatelessWidget {
  const _LandingStage({
    super.key,
    required this.onStart,
    required this.onSkip,
  });

  final VoidCallback onStart;
  final VoidCallback onSkip;

  @override
  Widget build(BuildContext context) {
    final palette = ViralPalette.of(context);
    final textTheme = Theme.of(context).textTheme;
    return LayoutBuilder(
      builder: (context, constraints) {
        final wide = constraints.maxWidth >= 760;
        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: wide ? 48 : 20, vertical: 18),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1040),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      const _BrandMark(),
                      const Spacer(),
                      const ViralThemeToggle(),
                      const SizedBox(width: 8),
                      TextButton(
                        onPressed: onSkip,
                        child: Text(wide ? 'já uso o repertório →' : 'entrar →'),
                      ),
                    ],
                  ),
                  SizedBox(height: wide ? 70 : 46),
                  if (wide)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(child: _HeroCopy(onStart: onStart)),
                        const SizedBox(width: 48),
                        const Expanded(child: _ScorePreview()),
                      ],
                    )
                  else ...[
                    _HeroCopy(onStart: onStart),
                    const SizedBox(height: 36),
                    const _ScorePreview(),
                  ],
                  SizedBox(height: wide ? 72 : 48),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: palette.text, width: 1.2),
                        bottom: BorderSide(color: palette.text, width: 1.2),
                      ),
                    ),
                    child: const Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      spacing: 22,
                      runSpacing: 12,
                      children: [
                        _MiniProof('2 MIN', 'para descobrir'),
                        _MiniProof('10', 'perguntas por rodada'),
                        _MiniProof('0 CADASTRO', 'para começar'),
                        _MiniProof('1 SCORE', 'feito para compartilhar'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 34),
                  Text(
                    'UM POUCO SOBRE TUDO.\nTODO DIA.',
                    style: textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w900,
                      letterSpacing: -1.2,
                      height: .96,
                    ),
                  ),
                  const SizedBox(height: 18),
                  const Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      _TopicPill('psicologia'),
                      _TopicPill('dinheiro'),
                      _TopicPill('arte'),
                      _TopicPill('história'),
                      _TopicPill('tecnologia'),
                      _TopicPill('cultura'),
                      _TopicPill('mundo'),
                      _TopicPill('ciência'),
                    ],
                  ),
                  const SizedBox(height: 52),
                  Center(
                    child: Text(
                      'repertório* / beta viral',
                      style: textTheme.labelMedium?.copyWith(
                        color: palette.muted,
                        letterSpacing: 1.4,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _HeroCopy extends StatelessWidget {
  const _HeroCopy({required this.onStart});

  final VoidCallback onStart;

  @override
  Widget build(BuildContext context) {
    final palette = ViralPalette.of(context);
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: palette.accentSoft,
            borderRadius: BorderRadius.circular(999),
          ),
          child: Text(
            'REPERTÓRIO SCORE / BETA',
            style: textTheme.labelSmall?.copyWith(
              color: palette.accentStrong,
              fontWeight: FontWeight.w900,
              letterSpacing: 1,
            ),
          ),
        ),
        const SizedBox(height: 22),
        Text(
          'VOCÊ TEM\nASSUNTO?',
          style: textTheme.displayMedium?.copyWith(
            fontWeight: FontWeight.w900,
            height: .86,
            letterSpacing: -3.4,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Descubra quanto repertório você tem hoje — e transforme curiosidade em algo que cresce todos os dias.',
          style: textTheme.titleMedium?.copyWith(height: 1.42),
        ),
        const SizedBox(height: 28),
        FilledButton.icon(
          onPressed: onStart,
          style: FilledButton.styleFrom(
            backgroundColor: palette.accent,
            foregroundColor: palette.onAccent,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          icon: const Icon(Icons.arrow_outward_rounded, size: 19),
          label: const Text(
            'DESCOBRIR MEU SCORE',
            style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: .5),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'grátis · sem login · resultado compartilhável',
          style: textTheme.bodySmall?.copyWith(color: palette.muted),
        ),
      ],
    );
  }
}

class _ScorePreview extends StatelessWidget {
  const _ScorePreview();

  @override
  Widget build(BuildContext context) {
    final palette = ViralPalette.of(context);
    final textTheme = Theme.of(context).textTheme;
    return Transform.rotate(
      angle: .018,
      child: Container(
        padding: const EdgeInsets.fromLTRB(24, 22, 24, 26),
        decoration: BoxDecoration(
          color: palette.surface,
          border: Border.all(color: palette.line, width: 1.2),
          boxShadow: [
            BoxShadow(
              color: palette.shadow,
              offset: const Offset(8, 8),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'REPERTÓRIO*',
                  style: textTheme.labelLarge?.copyWith(
                    color: palette.accent,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.2,
                  ),
                ),
                const Spacer(),
                const Text('001/∞'),
              ],
            ),
            const SizedBox(height: 42),
            Text(
              '742',
              style: textTheme.displayLarge?.copyWith(
                color: palette.accent,
                fontSize: 88,
                height: .9,
                fontWeight: FontWeight.w900,
                letterSpacing: -5,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'CURIOSO CAÓTICO',
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w900,
                letterSpacing: -.7,
              ),
            ),
            const SizedBox(height: 28),
            LinearProgressIndicator(
              value: .74,
              minHeight: 9,
              backgroundColor: palette.line,
              color: palette.accent,
            ),
            const SizedBox(height: 18),
            Text(
              'psicologia · cultura · tecnologia',
              style: textTheme.bodySmall?.copyWith(
                color: palette.muted,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _QuizStage extends StatelessWidget {
  const _QuizStage({
    super.key,
    required this.question,
    required this.index,
    required this.total,
    required this.selectedAnswer,
    required this.onAnswer,
    required this.onBack,
  });

  final ViralScoreQuestion question;
  final int index;
  final int total;
  final int? selectedAnswer;
  final ValueChanged<int> onAnswer;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    final palette = ViralPalette.of(context);
    final textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 32),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 720),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  IconButton(onPressed: onBack, icon: const Icon(Icons.arrow_back)),
                  const SizedBox(width: 6),
                  const _BrandMark(),
                  const Spacer(),
                  const ViralThemeToggle(),
                  const SizedBox(width: 10),
                  Text(
                    '${index + 1}/$total',
                    style: textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w900),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              ClipRRect(
                borderRadius: BorderRadius.circular(99),
                child: TweenAnimationBuilder<double>(
                  tween: Tween(
                    begin: index / total,
                    end: (index + 1) / total,
                  ),
                  duration: const Duration(milliseconds: 520),
                  curve: Curves.easeOutCubic,
                  builder: (context, value, _) {
                    return LinearProgressIndicator(
                      value: value,
                      minHeight: 7,
                      color: palette.accent,
                      backgroundColor: palette.line,
                    );
                  },
                ),
              ),
              const SizedBox(height: 44),
              Text(
                question.category,
                style: textTheme.labelMedium?.copyWith(
                  color: palette.accent,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                question.question,
                style: textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w900,
                  letterSpacing: -1,
                  height: 1.02,
                ),
              ),
              const SizedBox(height: 30),
              ...List.generate(
                question.answers.length,
                (answerIndex) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: _AnswerButton(
                    label: question.answers[answerIndex],
                    prefix: String.fromCharCode(65 + answerIndex),
                    selected: selectedAnswer == answerIndex,
                    locked: selectedAnswer != null,
                    onTap: () => onAnswer(answerIndex),
                  ),
                ),
              ),
              const SizedBox(height: 18),
              Text(
                'Não vale pesquisar. O charme está justamente no que já mora na sua cabeça.',
                textAlign: TextAlign.center,
                style: textTheme.bodySmall?.copyWith(
                  color: palette.muted,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AnswerButton extends StatelessWidget {
  const _AnswerButton({
    required this.label,
    required this.prefix,
    required this.selected,
    required this.locked,
    required this.onTap,
  });

  final String label;
  final String prefix;
  final bool selected;
  final bool locked;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final palette = ViralPalette.of(context);
    final dimmed = locked && !selected;

    return AnimatedScale(
      scale: selected ? 1.012 : 1,
      duration: const Duration(milliseconds: 180),
      curve: Curves.easeOutBack,
      child: AnimatedOpacity(
        opacity: dimmed ? .54 : 1,
        duration: const Duration(milliseconds: 180),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: locked ? null : onTap,
            borderRadius: BorderRadius.circular(14),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 220),
              curve: Curves.easeOutCubic,
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
              decoration: BoxDecoration(
                color: selected ? palette.accentSoft : palette.surface,
                border: Border.all(
                  color: selected ? palette.accent : palette.line,
                  width: selected ? 1.6 : 1.1,
                ),
                borderRadius: BorderRadius.circular(14),
                boxShadow: selected
                    ? [
                        BoxShadow(
                          color: palette.shadow,
                          offset: const Offset(0, 6),
                          blurRadius: 18,
                        ),
                      ]
                    : null,
              ),
              child: Row(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 220),
                    width: 36,
                    height: 36,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: selected ? palette.accent : palette.accentSoft,
                      borderRadius: BorderRadius.circular(9),
                    ),
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 160),
                      child: selected
                          ? Icon(
                              Icons.check_rounded,
                              key: const ValueKey('selected'),
                              color: palette.onAccent,
                              size: 20,
                            )
                          : Text(
                              prefix,
                              key: const ValueKey('prefix'),
                              style: TextStyle(
                                color: palette.accentStrong,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Text(
                      label,
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.25,
                        fontWeight: selected ? FontWeight.w800 : FontWeight.w600,
                      ),
                    ),
                  ),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 160),
                    child: selected
                        ? Icon(
                            Icons.arrow_forward_rounded,
                            key: const ValueKey('selected-arrow'),
                            color: palette.accent,
                            size: 19,
                          )
                        : const Icon(
                            Icons.arrow_forward_rounded,
                            key: ValueKey('idle-arrow'),
                            size: 18,
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ResultStage extends StatelessWidget {
  const _ResultStage({
    super.key,
    required this.result,
    required this.previousScore,
    required this.onEnterApp,
    required this.onRestart,
  });

  final ViralScoreResult result;
  final int? previousScore;
  final VoidCallback onEnterApp;
  final VoidCallback onRestart;

  Future<void> _share(BuildContext context) async {
    final strengths = result.strengths.isEmpty
        ? 'curiosidade em construção'
        : result.strengths.map((item) => item.toLowerCase()).join(' · ');
    final shareUri = Uri.base.replace(
      queryParameters: {
        'score': result.score.toString(),
        'a': result.archetype,
      },
    );
    final shared = await shareViralScore(
      score: result.score,
      archetype: result.archetype,
      strengths: strengths,
      shareUrl: shareUri.toString(),
    );
    if (!context.mounted || shared) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Seu card foi preparado para compartilhar.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final palette = ViralPalette.of(context);
    final textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 34),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 760),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Row(
                children: [
                  _BrandMark(),
                  Spacer(),
                  ViralThemeToggle(),
                  SizedBox(width: 10),
                  Text('SCORE / BETA'),
                ],
              ),
              const SizedBox(height: 38),
              TweenAnimationBuilder<double>(
                tween: Tween(begin: 0, end: 1),
                duration: const Duration(milliseconds: 620),
                curve: Curves.easeOutCubic,
                builder: (context, reveal, child) {
                  return Opacity(
                    opacity: reveal,
                    child: Transform.translate(
                      offset: Offset(0, 18 * (1 - reveal)),
                      child: child,
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(24, 24, 24, 28),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        palette.surface,
                        palette.accentSoft.withValues(alpha: .62),
                      ],
                    ),
                    border: Border.all(color: palette.line, width: 1.2),
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: palette.shadow,
                        offset: const Offset(0, 12),
                        blurRadius: 28,
                      ),
                    ],
                  ),
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: palette.accent,
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: Text(
                            'RESULTADO DESBLOQUEADO',
                            style: textTheme.labelSmall?.copyWith(
                              color: palette.onAccent,
                              fontWeight: FontWeight.w900,
                              letterSpacing: .8,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          'BETA / 01',
                          style: textTheme.labelSmall?.copyWith(
                            color: palette.muted,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1.1,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'SEU REPERTÓRIO SCORE',
                      style: textTheme.labelMedium?.copyWith(
                        color: palette.accent,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.4,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _AnimatedScoreNumber(score: result.score),
                    const SizedBox(height: 16),
                    Transform.rotate(
                      angle: -.008,
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.fromLTRB(18, 14, 18, 16),
                        decoration: BoxDecoration(
                          color: palette.accent,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'SEU ARQUÉTIPO',
                              style: textTheme.labelSmall?.copyWith(
                                color: palette.onAccent.withValues(alpha: .78),
                                fontWeight: FontWeight.w900,
                                letterSpacing: 1.15,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              result.archetype,
                              style: textTheme.headlineMedium?.copyWith(
                                color: palette.onAccent,
                                fontWeight: FontWeight.w900,
                                letterSpacing: -1.1,
                                height: .98,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),
                    Text(
                      result.description,
                      style: textTheme.bodyLarge?.copyWith(height: 1.45),
                    ),
                    const SizedBox(height: 24),
                    _ScoreBand(score: result.score),
                    if (previousScore != null) ...[
                      const SizedBox(height: 14),
                      _PreviousScoreDelta(
                        current: result.score,
                        previous: previousScore!,
                      ),
                    ],
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        _ResultMetric(
                          value: '${result.correct}/${result.total}',
                          label: 'acertos',
                        ),
                        const SizedBox(width: 26),
                        _ResultMetric(
                          value: '+${result.score - 390}',
                          label: 'pontos nesta rodada',
                        ),
                      ],
                    ),
                    if (result.strengths.isNotEmpty) ...[
                      const SizedBox(height: 26),
                      Text(
                        'SEUS PONTOS FORTES',
                        style: textTheme.labelSmall?.copyWith(
                          color: palette.muted,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 9),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: result.strengths
                            .map((item) => _TopicPill(item.toLowerCase()))
                            .toList(),
                      ),
                    ],
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              FilledButton.icon(
                onPressed: () => _share(context),
                style: FilledButton.styleFrom(
                  backgroundColor: palette.accent,
                  foregroundColor: palette.onAccent,
                  padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                icon: const Icon(Icons.auto_awesome_rounded),
                label: const Text(
                  'COMPARTILHAR MEU SCORE',
                  style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: .45),
                ),
              ),
              const SizedBox(height: 12),
              OutlinedButton.icon(
                onPressed: onEnterApp,
                style: OutlinedButton.styleFrom(
                  foregroundColor: palette.text,
                  padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
                  side: BorderSide(color: palette.line, width: 1.2),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                icon: const Icon(Icons.trending_up_rounded),
                label: const Text(
                  'QUERO AUMENTAR MEU SCORE',
                  style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: .35),
                ),
              ),
              const SizedBox(height: 10),
              TextButton(onPressed: onRestart, child: const Text('refazer o teste')),
              const SizedBox(height: 18),
              Text(
                'Score experimental calculado a partir das 10 questões desta rodada. Não é uma medida de inteligência nem comparação científica entre pessoas.',
                textAlign: TextAlign.center,
                style: textTheme.bodySmall?.copyWith(color: palette.muted, height: 1.35),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PreviousScoreDelta extends StatelessWidget {
  const _PreviousScoreDelta({
    required this.current,
    required this.previous,
  });

  final int current;
  final int previous;

  @override
  Widget build(BuildContext context) {
    final palette = ViralPalette.of(context);
    final delta = current - previous;
    final neutral = delta == 0;
    final signal = delta > 0 ? '+' : '';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
      decoration: BoxDecoration(
        color: neutral
            ? palette.surface
            : palette.accentSoft.withValues(alpha: .72),
        border: Border.all(color: palette.line),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(
            neutral
                ? Icons.horizontal_rule_rounded
                : delta > 0
                    ? Icons.trending_up_rounded
                    : Icons.trending_down_rounded,
            size: 18,
            color: neutral ? palette.muted : palette.accent,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              neutral
                  ? 'mesmo score da sua rodada anterior'
                  : '$signal$delta pontos vs. sua rodada anterior',
              style: TextStyle(
                color: neutral ? palette.muted : palette.accentStrong,
                fontWeight: FontWeight.w800,
                fontSize: 12.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class _AnimatedScoreNumber extends StatelessWidget {
  const _AnimatedScoreNumber({required this.score});

  final int score;

  @override
  Widget build(BuildContext context) {
    final palette = ViralPalette.of(context);
    final textTheme = Theme.of(context).textTheme;

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 390, end: score.toDouble()),
      duration: const Duration(milliseconds: 1150),
      curve: Curves.easeOutExpo,
      builder: (context, value, _) {
        return Text(
          value.round().toString(),
          style: textTheme.displayLarge?.copyWith(
            color: palette.accent,
            fontSize: 102,
            height: .84,
            letterSpacing: -6.4,
            fontWeight: FontWeight.w900,
          ),
        );
      },
    );
  }
}

class _ScoreBand extends StatelessWidget {
  const _ScoreBand({required this.score});

  final int score;

  @override
  Widget build(BuildContext context) {
    final palette = ViralPalette.of(context);
    final textTheme = Theme.of(context).textTheme;
    final progress = ((score - 390) / (830 - 390)).clamp(0.0, 1.0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Text(
              '390',
              style: textTheme.labelSmall?.copyWith(
                color: palette.muted,
                fontWeight: FontWeight.w800,
              ),
            ),
            const Spacer(),
            Text(
              'SEU SCORE NESTA VERSÃO DO TESTE',
              style: textTheme.labelSmall?.copyWith(
                color: palette.muted,
                fontWeight: FontWeight.w900,
                letterSpacing: .55,
              ),
            ),
            const Spacer(),
            Text(
              '830',
              style: textTheme.labelSmall?.copyWith(
                color: palette.muted,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(999),
          child: TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: progress),
            duration: const Duration(milliseconds: 980),
            curve: Curves.easeOutCubic,
            builder: (context, value, _) {
              return LinearProgressIndicator(
                value: value,
                minHeight: 10,
                backgroundColor: palette.line.withValues(alpha: .75),
                color: palette.accent,
              );
            },
          ),
        ),
      ],
    );
  }
}


class _BrandMark extends StatelessWidget {
  const _BrandMark();

  @override
  Widget build(BuildContext context) {
    final palette = ViralPalette.of(context);
    return Text(
      'repertório*',
      style: TextStyle(
        color: palette.accent,
        fontSize: 21,
        fontWeight: FontWeight.w900,
        letterSpacing: -.9,
      ),
    );
  }
}

class _MiniProof extends StatelessWidget {
  const _MiniProof(this.value, this.label);
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    final palette = ViralPalette.of(context);
    return SizedBox(
      width: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: TextStyle(
              color: palette.accent,
              fontSize: 15,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 3),
          Text(label, style: TextStyle(color: palette.muted, fontSize: 12)),
        ],
      ),
    );
  }
}

class _TopicPill extends StatelessWidget {
  const _TopicPill(this.label);
  final String label;

  @override
  Widget build(BuildContext context) {
    final palette = ViralPalette.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: palette.surface,
        border: Border.all(color: palette.line),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _ResultMetric extends StatelessWidget {
  const _ResultMetric({required this.value, required this.label});
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    final palette = ViralPalette.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(value, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w900)),
        Text(label, style: TextStyle(color: palette.muted, fontSize: 12)),
      ],
    );
  }
}

class ViralScoreResult {
  const ViralScoreResult({
    required this.score,
    required this.correct,
    required this.total,
    required this.archetype,
    required this.description,
    required this.strengths,
  });
  final int score;
  final int correct;
  final int total;
  final String archetype;
  final String description;
  final List<String> strengths;
}
