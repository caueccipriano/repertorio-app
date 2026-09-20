import 'package:flutter_test/flutter_test.dart';
import 'package:repertorio_app/features/viral/data/viral_score_focus.dart';

void main() {
  test('score focus maps a weak category to a matching unseen topic', () {
    final topic = topicForScoreFocus(
      weakCategories: const ['CIÊNCIA'],
    );

    expect(topic, isNotNull);
    final normalized = <String>{
      ...topic!.tags.map(normalizeScoreText),
      normalizeScoreText(topic.eyebrow),
      normalizeScoreText(topic.title),
    }.join(' ');

    expect(
      scoreTagsForCategory('CIÊNCIA').any(normalized.contains),
      isTrue,
    );
  });

  test('score focus skips excluded topics', () {
    final first = topicForScoreFocus(
      weakCategories: const ['ARTE & DESIGN'],
    );
    expect(first, isNotNull);

    final second = topicForScoreFocus(
      weakCategories: const ['ARTE & DESIGN'],
      excludedIds: {first!.id},
    );

    expect(second, isNotNull);
    expect(second!.id, isNot(first.id));
  });

  test('score focus reason remains descriptive', () {
    expect(
      scoreFocusReason('TECNOLOGIA'),
      'porque seu Score pediu mais tecnologia',
    );
  });
}
