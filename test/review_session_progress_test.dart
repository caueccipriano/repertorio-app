import 'package:flutter_test/flutter_test.dart';
import 'package:repertorio_app/features/review/domain/review_session_progress.dart';

void main() {
  test('due topic is graded once at the end with its weakest card', () {
    final session = ReviewSessionProgress(isDueSession: true);
    expect(session.gradeForAnswer('bauhaus', 2, isLastForTopic: false), isNull);
    expect(session.gradeForAnswer('bauhaus', 0, isLastForTopic: false), isNull);
    expect(session.gradeForAnswer('bauhaus', 1, isLastForTopic: true), 0);
    session.completeTopic('bauhaus');
    expect(session.completedTopics, 1);
    expect(session.gradeForAnswer('bauhaus', 2, isLastForTopic: true), isNull);
  });

  test('warm-up never changes a scheduled due date', () {
    final warmup = ReviewSessionProgress(isDueSession: false);
    expect(warmup.gradeForAnswer('bauhaus', 0, isLastForTopic: false), isNull);
    expect(warmup.gradeForAnswer('bauhaus', 1, isLastForTopic: true), isNull);
    warmup.completeTopic('bauhaus');
    expect(warmup.completedTopics, 1);
  });
}
