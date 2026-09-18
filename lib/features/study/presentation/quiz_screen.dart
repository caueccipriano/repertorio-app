import 'package:flutter/material.dart';

import '../../../app/state/app_state_scope.dart';
import '../../../app/theme/app_colors.dart';
import '../../today/domain/knowledge_topic.dart';
import '../data/study_content.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({
    super.key,
    required this.topic,
  });

  final KnowledgeTopic topic;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  var _index = 0;
  var _score = 0;
  int? _selected;
  bool _finished = false;

  List<QuizQuestion> get _questions => quizFor(widget.topic.id);

  @override
  Widget build(BuildContext context) {
    final questions = _questions;

    if (questions.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text('quiz')),
        body: const Center(
          child: Text('Este assunto ainda não tem quiz.'),
        ),
      );
    }

    if (_finished) {
      return _Result(
        topic: widget.topic,
        score: _score,
        total: questions.length,
        onRetry: () => setState(() {
          _index = 0;
          _score = 0;
          _selected = null;
          _finished = false;
        }),
      );
    }

    final question = questions[_index];

    return Scaffold(
      appBar: AppBar(
        title: Text('${_index + 1}/${questions.length}'),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(18, 22, 18, 34),
          children: [
            Text(
              widget.topic.tags.join(' · ').toUpperCase(),
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: AppColors.blue,
                    fontSize: 9,
                    letterSpacing: 1.1,
                  ),
            ),
            const SizedBox(height: 10),
            Text(
              question.prompt,
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontSize: 34,
                  ),
            ),
            const SizedBox(height: 28),
            ...question.options.indexed.map((item) {
              final selected = _selected == item.$1;
              final correct = item.$1 == question.correctIndex;
              final revealed = _selected != null;

              Color? background;
              if (revealed && correct) {
                background = AppColors.softBlue;
              } else if (revealed && selected && !correct) {
                background = const Color(0xFFF3DFD7);
              }

              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Material(
                  color: background ?? AppColors.paperWhite,
                  child: InkWell(
                    onTap: revealed
                        ? null
                        : () => setState(() {
                              _selected = item.$1;
                              if (correct) {
                                _score++;
                              }
                            }),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: selected || (revealed && correct)
                              ? AppColors.blue
                              : AppColors.ink,
                          width: selected || (revealed && correct) ? 2 : 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              item.$2,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                          if (revealed && correct)
                            const Icon(
                              Icons.check_circle,
                              color: AppColors.blue,
                            ),
                          if (revealed && selected && !correct)
                            const Icon(Icons.close),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
            if (_selected != null) ...[
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(16),
                color: AppColors.paperWhite,
                child: Text(
                  question.explanation,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              const SizedBox(height: 18),
              FilledButton(
                onPressed: _next,
                child: Text(
                  _index == questions.length - 1
                      ? 'ver resultado'
                      : 'próxima',
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Future<void> _next() async {
    if (_index == _questions.length - 1) {
      await AppStateScope.read(context).recordQuiz(
        widget.topic.id,
        score: _score,
        total: _questions.length,
      );
      if (!mounted) {
        return;
      }
      setState(() => _finished = true);
      return;
    }

    setState(() {
      _index++;
      _selected = null;
    });
  }
}

class _Result extends StatelessWidget {
  const _Result({
    required this.topic,
    required this.score,
    required this.total,
    required this.onRetry,
  });

  final KnowledgeTopic topic;
  final int score;
  final int total;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final percent = ((score / total) * 100).round();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              Text(
                '$score/$total',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      color: AppColors.blue,
                      fontSize: 78,
                    ),
              ),
              Text(
                '$percent% neste quiz',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 12),
              Text(
                'O resultado ficou salvo no seu repertório. O objetivo não é acertar tudo de primeira — é descobrir o que vale revisar.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.muted,
                    ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: onRetry,
                  child: const Text('tentar de novo'),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('voltar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
