class KnowledgeTopic {
  const KnowledgeTopic({
    required this.id,
    required this.eyebrow,
    required this.title,
    required this.summary,
    required this.minutes,
    required this.tags,
    required this.quickTake,
    required this.body,
    required this.remember,
    required this.whyItMatters,
    required this.curiosity,
    required this.connections,
  });

  final String id;
  final String eyebrow;
  final String title;
  final String summary;
  final int minutes;
  final List<String> tags;
  final String quickTake;
  final List<String> body;
  final List<String> remember;
  final String whyItMatters;
  final String curiosity;
  final List<String> connections;
}
