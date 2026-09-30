import 'package:flutter_test/flutter_test.dart';
import 'package:repertorio_app/features/review/domain/highlight_recall.dart';
import 'package:repertorio_app/features/today/data/demo_topics.dart';

void main() {
  test('converts only known user-selected passages to faithful recall cards', () {
    final selected = <String>{'body:0', 'quick', 'unknown', 'body:0', 'why'};
    final snapshot = Set<String>.from(selected);
    final cards = highlightedRecallFor(bauhausTopic, selected);
    expect(cards.length, 2);
    expect(cards.map((card) => card.passageId), ['quick', 'body:0']);
    expect(cards.first.answer, bauhausTopic.quickTake);
    expect(cards.last.answer, bauhausTopic.body.first);
    expect(selected, snapshot);
  });

  test('does not invent cards for empty selections or unsupported passages', () {
    expect(highlightedRecallFor(bauhausTopic, []), isEmpty);
    expect(highlightedRecallFor(bauhausTopic, ['totally-unknown']), isEmpty);
    expect(highlightedRecallFor(bauhausTopic, ['quick'], maxCards: 0), isEmpty);
  });

  test('star and highlight referring to same passage generate one card', () {
    final ids = {...<String>{'quick'}, ...<String>{'quick', 'curiosity'}};
    final cards = highlightedRecallFor(bauhausTopic, ids, maxCards: 3);
    expect(cards.map((card) => card.passageId), ['quick','curiosity']);
  });
}
