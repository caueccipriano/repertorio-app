// This is a read-only agenda derived from the existing scheduler.
 // Never adjust persisted dates while displaying an upcoming review.
List<MapEntry<String, DateTime>> upcomingReviews(
  Map<String, DateTime> scheduled, {
  required DateTime now,
}) {
  final items = scheduled.entries
      .where((entry) => entry.value.isAfter(now))
      .toList();
  items.sort((a, b) {
    final dateOrder = a.value.compareTo(b.value);
    return dateOrder != 0 ? dateOrder : a.key.compareTo(b.key);
  });
  return items;
}
