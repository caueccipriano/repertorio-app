enum KnowledgeMediaType { image, video, audio }

class KnowledgeMedia {
  const KnowledgeMedia({
    required this.type,
    required this.url,
    required this.title,
    this.caption,
    this.sourceLabel,
    this.sourceUrl,
  });

  final KnowledgeMediaType type;
  final String url;
  final String title;
  final String? caption;
  final String? sourceLabel;
  final String? sourceUrl;
}

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
    this.media = const [],
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
  final List<KnowledgeMedia> media;
}
