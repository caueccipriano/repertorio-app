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

/// An editorial chapter provides context beyond the introductory article.
/// Optional so legacy topics remain compatible while their content is reviewed.
class KnowledgeChapter {
  const KnowledgeChapter({required this.title, required this.paragraphs});

  final String title;
  final List<String> paragraphs;
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
    this.simpleExplanation,
    this.example,
    required this.body,
    this.chapters = const [],
    required this.remember,
    required this.whyItMatters,
    required this.curiosity,
    required this.connections,
    List<KnowledgeMedia> media = const [],
  }) : _media = media;

  final String id;
  final String eyebrow;
  final String title;
  final String summary;
  final int minutes;
  final List<String> tags;
  final String quickTake;
  final String? simpleExplanation;
  final String? example;
  final List<String> body;
  final List<KnowledgeChapter> chapters;
  final List<String> remember;
  final String whyItMatters;
  final String curiosity;
  final List<String> connections;
  final List<KnowledgeMedia> _media;

  /// Curated audio is preserved when a topic already has it.
  ///
  /// For every remaining theme, the app provides a topic-aware Spotify podcast
  /// search. This keeps the reader play button useful across the complete
  /// 125-theme repertory instead of falling back to speech synthesis.
  List<KnowledgeMedia> get media {
    final hasAudio = _media.any((item) => item.type == KnowledgeMediaType.audio);
    if (hasAudio) {
      return _media;
    }
    return <KnowledgeMedia>[
      ..._media,
      _podcastFallback,
    ];
  }

  KnowledgeMedia get _podcastFallback {
    final searchTerms = _podcastSearchTerms();
    final encoded = Uri.encodeComponent(searchTerms);
    final url = 'https://open.spotify.com/search/$encoded/episodes';
    return KnowledgeMedia(
      type: KnowledgeMediaType.audio,
      url: url,
      title: 'Podcast sobre $title',
      caption: 'Busca contextual no Spotify · ${tags.take(2).join(' + ')}',
      sourceLabel: 'Spotify · busca de episódios',
      sourceUrl: url,
    );
  }

  String _podcastSearchTerms() {
    final cleanTitle = title
        .toLowerCase()
        .replaceAll('?', '')
        .replaceAll('!', '')
        .replaceAll(':', '')
        .replaceAll('—', ' ')
        .replaceAll('-', ' ')
        .trim();
    final tagHint = tags.take(2).join(' ');
    return '$cleanTitle $tagHint podcast português brasil';
  }
}
