import 'package:flutter_test/flutter_test.dart';
import 'package:repertorio_app/features/viral/data/viral_score_content.dart';

void main() {
  test('viral score round uses ten questions with broad category coverage', () {
    final round = buildViralRound(seed: 42);

    expect(round, hasLength(10));
    expect(round.map((q) => q.category).toSet().length, greaterThanOrEqualTo(8));
    expect(round.toSet().length, 10);
  });

  test('viral score round changes with a different seed', () {
    final first = buildViralRound(seed: 42).map((q) => q.question).toList();
    final second = buildViralRound(seed: 99).map((q) => q.question).toList();

    expect(first, isNot(equals(second)));
  });

  test('viral profiles stay descriptive rather than scientific rankings', () {
    expect(
      resolveViralProfile(score: 820, breadth: 8).archetype,
      'ARQUIVO VIVO',
    );
    expect(
      resolveViralProfile(score: 720, breadth: 6).archetype,
      'CONECTOR CULTURAL',
    );
    expect(
      resolveViralProfile(score: 640, breadth: 5).archetype,
      'CABEÇA DE WIKIPEDIA',
    );
    expect(
      resolveViralProfile(score: 560, breadth: 4).archetype,
      'CURIOSO CAÓTICO',
    );
    expect(
      resolveViralProfile(score: 470, breadth: 2).archetype,
      'RADAR CULTURAL',
    );
  });
}
