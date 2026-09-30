/// Read-only annotation index for a person's explicitly saved books.
//// It never changes the library or migration format.
Set<String> annotatedSavedTopicIds(
  Iterable<String> savedTopicIds, {
  required Map<String, String> notesByTopic,
  required Map<String, Set<String>> highlightsByTopic,
  required Map<String, Set<String>> starredByTopic,
}) {
  return savedTopicIds.where((id) =>
      (notesByTopic[id]?.trim().isNotEmpty ?? false) ||
      (highlightsByTopic[id]?.isNotEmpty ?? false) ||
      (starredByTopic[id]?.isNotEmpty ?? false)).toSet();
}
