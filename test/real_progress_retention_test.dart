import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:repertorio_app/app/state/app_state.dart';

void main() {
  test('first launch never erases existing local study progress', () async {
    // Deliberately omit the old test-reset marker: this is exactly the
    // dangerous state for people returning from an older PWA version.
    final saved = <String, Object>{
      'completed_topic_ids_v1': <String>['bauhaus'],
      'history_topic_ids_v1': <String>['bauhaus'],
      'reading_progress_v1': jsonEncode({'bauhaus': 0.78}),
      'review_level_v1': jsonEncode({'bauhaus': 2}),
      'review_due_v1': jsonEncode({'bauhaus': '2026-10-11T18:00:00.000Z'}),
      'last_study_at_v1': '2026-09-28T18:00:00.000Z',
      'last_study_reminder_at_v1': '2026-09-26T18:00:00.000Z',
      'study_days_v1': <String>['2026-09-28'],
      'quiz_scores_v1': jsonEncode({'bauhaus': {'score': 3, 'total': 4}}),
      'topic_last_opened_v1': jsonEncode({'bauhaus': '2026-09-28T18:00:00.000Z'}),
    };
    SharedPreferences.setMockInitialValues(saved);

    final state = await AppState.load();
    expect(state.completedTopicIds, contains('bauhaus'));
    expect(state.historyTopicIds, contains('bauhaus'));
    expect(state.progressFor('bauhaus'), closeTo(.78, .0001));
    expect(state.reviewLevelByTopic['bauhaus'], 2);
    expect(state.reviewDueByTopic['bauhaus']!.toUtc(),
        DateTime.utc(2026, 10, 11, 18));

    final prefs = await SharedPreferences.getInstance();
    for (final entry in saved.entries) {
      final value = entry.value;
      if (value is List<String>) {
        expect(prefs.getStringList(entry.key), value, reason: entry.key);
      } else {
        expect(prefs.getString(entry.key), value, reason: entry.key);
      }
    }

    final reloaded = await AppState.load();
    expect(reloaded.progressFor('bauhaus'), closeTo(.78, .0001));
    expect(reloaded.completedTopicIds, contains('bauhaus'));
  });

  test('fresh installation starts empty without a destructive migration', () async {
    SharedPreferences.setMockInitialValues({});
    final state = await AppState.load();
    expect(state.progressByTopic, isEmpty);
    expect(state.completedTopicIds, isEmpty);
    final prefs = await SharedPreferences.getInstance();
    expect(prefs.getBool('testing_progress_reset_2026_09_18_v1'), isNull);
  });
}
