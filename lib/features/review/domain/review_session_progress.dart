// A practice session is intentionally stable even while AppState notifies
// listeners after persisting each due topic's next review date.
class ReviewSessionProgress {
  ReviewSessionProgress({required this.isDueSession});

  final bool isDueSession;
  final Map<String, int> _lowestQualityByTopic = {};
  final Set<String> _completedTopicIds = {};

  int get completedTopics => _completedTopicIds.length;

  // Schedule only after the last card for a due topic. A missed card means
  // that topic needs the shorter interval, even if another card was easy.
  int? gradeForAnswer(
    String topicId,
    int quality, {
    required bool isLastForTopic,
  }) {
    if (_completedTopicIds.contains(topicId)) return null;
    final safeQuality = quality.clamp(0, 2).toInt();
    final previous = _lowestQualityByTopic[topicId];
    if (previous == null || safeQuality < previous) {
      _lowestQualityByTopic[topicId] = safeQuality;
    }
    if (!isLastForTopic || !isDueSession) return null;
    return _lowestQualityByTopic[topicId];
  }

  // Call only after an awaited save succeeds, so a failed save is retryable.
  void completeTopic(String topicId) {
    _completedTopicIds.add(topicId);
    _lowestQualityByTopic.remove(topicId);
  }
}
