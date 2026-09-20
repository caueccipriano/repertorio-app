import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../app/app_shell.dart';
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

    if (!mounted) return;
    setState(() {
      _entryComplete = prefs.getBool(_entryKey) ?? false;
      _sharedScore = sharedScore;
    });
  }

  void _startFromSharedScore() {
    setState(() {
      _sharedScore = null;
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
  int _questionIndex = 0;
  final List<int> _answers = [];

  static const _questions = <_ScoreQuestion>[
    _ScoreQuestion(
      category: 'PSICOLOGIA',
      question: 'O efeito placebo acontece quando…',
      answers: [
        'uma expectativa pode influenciar a percepção de sintomas',
        'o cérebro para de produzir dopamina',
        'um remédio funciona apenas durante o sono',
        'a memória apaga uma sensação desagradável',
      ],
      correctIndex: 0,
    ),
    _ScoreQuestion(
      category: 'HISTÓRIA',
      question: 'O Renascimento europeu começou primeiro com maior força em…',
      answers: ['Escandinávia', 'cidades italianas', 'Rússia', 'Península Ibérica'],
      correctIndex: 1,
    ),
    _ScoreQuestion(
      category: 'CIÊNCIA',
      question: 'Por que vemos o céu azul durante boa parte do dia?',
      answers: [
        'por causa do reflexo dos oceanos',
        'pela dispersão da luz solar na atmosfera',
        'porque o oxigênio é naturalmente azul',
        'por causa do campo magnético da Terra',
      ],
      correctIndex: 1,
    ),
    _ScoreQuestion(
      category: 'ECONOMIA',
      question: 'Inflação significa, de forma geral…',
      answers: [
        'queda contínua dos salários',
        'aumento generalizado do nível de preços',
        'alta automática do dólar',
        'crescimento da bolsa de valores',
      ],
      correctIndex: 1,
    ),
    _ScoreQuestion(
      category: 'ARTE',
      question: 'A Bauhaus ficou conhecida principalmente por aproximar…',
      answers: [
        'arte, design e função',
        'religião e pintura medieval',
        'ópera e cinema',
        'fotografia e jornalismo esportivo',
      ],
      correctIndex: 0,
    ),
    _ScoreQuestion(
      category: 'TECNOLOGIA',
      question: 'Quando um site usa HTTPS, o principal ganho é…',
      answers: [
        'carregar sem internet',
        'criptografar a comunicação com o site',
        'eliminar todos os rastreadores',
        'dispensar senhas',
      ],
      correctIndex: 1,
    ),
    _ScoreQuestion(
      category: 'MUNDO',
      question: 'Qual destes países não faz parte da União Europeia?',
      answers: ['Portugal', 'Croácia', 'Noruega', 'Espanha'],
      correctIndex: 2,
    ),
    _ScoreQuestion(
      category: 'CULTURA',
      question: 'Em narrativa, um narrador não confiável é aquele que…',
      answers: [
        'sempre fala em terceira pessoa',
        'pode distorcer ou limitar o que o leitor entende',
        'aparece apenas no final da história',
        'não possui nome',
      ],
      correctIndex: 1,
    ),
  ];

  void _start() {
    setState(() {
      _stage = 1;
      _questionIndex = 0;
      _answers.clear();
    });
  }

  void _answer(int answerIndex) {
    if (_answers.length > _questionIndex) return;
    setState(() => _answers.add(answerIndex));

    Future<void>.delayed(const Duration(milliseconds: 180), () {
      if (!mounted) return;
      if (_questionIndex == _questions.length - 1) {
        setState(() => _stage = 2);
      } else {
        setState(() => _questionIndex++);
      }
    });
  }

  ViralScoreResult get _result {
    var correct = 0;
    final strengths = <String>[];
    for (var i = 0; i < _answers.length && i < _questions.length; i++) {
      if (_answers[i] == _questions[i].correctIndex) {
        correct++;
        strengths.add(_questions[i].category);
      }
    }

    final score = 390 + correct * 55;
    if (score >= 775) {
      return ViralScoreResult(
        score: score,
        correct: correct,
        total: _questions.length,
        archetype: 'ENCICLOPÉDIA AMBULANTE',
        description:
            'Você conecta assuntos com facilidade e já chega nas conversas com munição cultural.',
        strengths: strengths.take(3).toList(),
      );
    }
    if (score >= 665) {
      return ViralScoreResult(
        score: score,
        correct: correct,
        total: _questions.length,
        archetype: 'CABEÇA DE WIKIPEDIA',
        description:
            'Seu repertório já é forte — e sua curiosidade costuma abrir mais abas do que você fecha.',
        strengths: strengths.take(3).toList(),
      );
    }
    if (score >= 555) {
      return ViralScoreResult(
        score: score,
        correct: correct,
        total: _questions.length,
        archetype: 'CURIOSO CAÓTICO',
        description:
            'Você sabe coisas muito específicas sobre assuntos aleatórios. Isso é um ótimo começo.',
        strengths: strengths.take(3).toList(),
      );
    }
    return ViralScoreResult(
      score: score,
      correct: correct,
      total: _questions.length,
      archetype: 'RADAR LIGADO',
      description:
          'Você tem curiosidade e espaço para crescer rápido. Um assunto por dia muda esse placar.',
      strengths: strengths.take(3).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PaperTexture(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 260),
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
                        child: const Text('já uso o repertório →'),
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
                        _MiniProof('8', 'perguntas rápidas'),
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
          boxShadow: const [
            BoxShadow(color: Color(0x22101010), offset: Offset(8, 8)),
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
    required this.onAnswer,
    required this.onBack,
  });

  final _ScoreQuestion question;
  final int index;
  final int total;
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
                child: LinearProgressIndicator(
                  value: (index + 1) / total,
                  minHeight: 7,
                  color: palette.accent,
                  backgroundColor: palette.line,
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
    required this.onTap,
  });

  final String label;
  final String prefix;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final palette = ViralPalette.of(context);
    return Material(
      color: palette.surface,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
          decoration: BoxDecoration(
            border: Border.all(color: palette.line, width: 1.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Container(
                width: 34,
                height: 34,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: palette.accentSoft,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  prefix,
                  style: TextStyle(
                    color: palette.accentStrong,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  label,
                  style: const TextStyle(
                    fontSize: 16,
                    height: 1.25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Icon(Icons.arrow_forward, size: 18),
            ],
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
    required this.onEnterApp,
    required this.onRestart,
  });

  final ViralScoreResult result;
  final VoidCallback onEnterApp;
  final VoidCallback onRestart;

  Future<void> _share(BuildContext context) async {
    final strengths = result.strengths.isEmpty
        ? 'curiosidade em construção'
        : result.strengths.map((item) => item.toLowerCase()).join(' · ');
    final shareUri = Uri.base.replace(
      queryParameters: {'score': result.score.toString()},
    );
    final shared = await shareKnowledgeCard(
      title: '${result.score} · ${result.archetype}',
      body:
          'Meu Repertório Score: ${result.score}. $strengths. Descubra o seu: $shareUri',
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
              Container(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 28),
                decoration: BoxDecoration(
                  color: palette.surface,
                  border: Border.all(color: palette.line, width: 1.2),
                  boxShadow: const [
                    BoxShadow(color: Color(0x22101010), offset: Offset(8, 8)),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'SEU REPERTÓRIO SCORE',
                      style: textTheme.labelMedium?.copyWith(
                        color: palette.accent,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.4,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '${result.score}',
                      style: textTheme.displayLarge?.copyWith(
                        color: palette.accent,
                        fontSize: 96,
                        height: .88,
                        letterSpacing: -6,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      result.archetype,
                      style: textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w900,
                        letterSpacing: -1.1,
                        height: .98,
                      ),
                    ),
                    const SizedBox(height: 18),
                    Text(result.description, style: textTheme.bodyLarge?.copyWith(height: 1.45)),
                    const SizedBox(height: 26),
                    Row(
                      children: [
                        _ResultMetric(value: '${result.correct}/${result.total}', label: 'acertos'),
                        const SizedBox(width: 26),
                        _ResultMetric(value: '${result.score - 390}', label: 'pontos ganhos'),
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
              const SizedBox(height: 30),
              FilledButton.icon(
                onPressed: () => _share(context),
                style: FilledButton.styleFrom(
                  backgroundColor: palette.accent,
                  foregroundColor: palette.onAccent,
                  padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                icon: const Icon(Icons.ios_share_rounded),
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
                'Score inicial experimental calculado a partir destas 8 questões. Não é uma medida de inteligência nem comparação científica entre pessoas.',
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

class _ScoreQuestion {
  const _ScoreQuestion({
    required this.category,
    required this.question,
    required this.answers,
    required this.correctIndex,
  });
  final String category;
  final String question;
  final List<String> answers;
  final int correctIndex;
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
