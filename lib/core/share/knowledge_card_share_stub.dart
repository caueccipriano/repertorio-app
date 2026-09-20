bool get knowledgeCardShareSupported => false;

Future<bool> shareKnowledgeCard({
  required String title,
  required String body,
}) async =>
    false;


bool get viralScoreShareSupported => false;

Future<bool> shareViralScore({
  required int score,
  required String archetype,
  required String strengths,
  required String shareUrl,
}) async =>
    false;


bool get repertoryProfileShareSupported => false;

Future<bool> shareRepertoryProfile({
  required int score,
  required String archetype,
  required String strengths,
  required String countsJson,
  required String shareUrl,
}) async =>
    false;
