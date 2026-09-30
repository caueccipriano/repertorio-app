import 'package:flutter_test/flutter_test.dart';
import 'package:repertorio_app/features/review/domain/upcoming_reviews.dart';

void main() {
  test('read-only agenda excludes overdue topics and sorts next reviews', () {
    final now = DateTime.utc(2026, 9, 30, 12);
    final scheduled = {
      'old': now.subtract(const Duration(days: 1)),
      'later': now.add(const Duration(days: 14)),
      'soon': now.add(const Duration(days: 1)),
      'current': now,
    };
    final unchanged = Map<String, DateTime>.from(scheduled);
    final agenda = upcomingReviews(scheduled, now: now);
    expect(agenda.map((e) => e.key).toList(), ['soon', 'later']);
    expect(scheduled, unchanged);
  });

  test('same-day review dates keep stable alphabetical order', () {
    final now = DateTime.utc(2026, 9, 30);
    final tomorrow = now.add(const Duration(days: 1));
    final agenda = upcomingReviews({'z': tomorrow, 'a': tomorrow}, now: now);
    expect(agenda.map((e) => e.key).toList(), ['a', 'z']);
  });
}
