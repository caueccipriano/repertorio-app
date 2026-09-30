import 'package:flutter_test/flutter_test.dart';
import 'package:repertorio_app/features/saved/domain/annotated_saved_topics.dart';

void main() {
  test('indexes only explicitly saved topics with meaningful annotations', () {
    final saved = <String>{'bauhaus', 'inflation', 'empty', 'marked', 'starred'};
    final notes = {'bauhaus': 'A ideia que quero lembrar', 'empty': '   ', 'unsaved': 'secret'};
    final highlights = {'marked': <String>{'paragraph-2'}};
    final starred = {'starred': <String>{'paragraph-4'}, 'inflation': <String>{}};
    final result = annotatedSavedTopicIds(
      saved,
      notesByTopic: notes,
      highlightsByTopic: highlights,
      starredByTopic: starred,
    );
    expect(result, {'bauhaus','marked','starred'});
    expect(saved, hasLength(5));
    expect(notes['unsaved'], 'secret');
  });

  test('an empty library or missing annotation maps never creates a saved topic', () {
    expect(annotatedSavedTopicIds(
      <String>{}, notesByTopic: {'unsaved':'note'},
      highlightsByTopic: {}, starredByTopic: {},
    ), isEmpty);
    expect(annotatedSavedTopicIds(
      {'a'}, notesByTopic: {},
      highlightsByTopic: {'a': <String>{}}, starredByTopic: {},
    ), isEmpty);
  });
}
