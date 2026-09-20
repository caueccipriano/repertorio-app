import 'dart:js_interop';

@JS('repertorioShareCard.supported')
external JSBoolean _supported();

@JS('repertorioShareCard.share')
external JSPromise<JSBoolean> _share(JSString title, JSString body);

bool get knowledgeCardShareSupported => _supported().toDart;

Future<bool> shareKnowledgeCard({
  required String title,
  required String body,
}) async {
  if (!knowledgeCardShareSupported) {
    return false;
  }
  final result = await _share(title.toJS, body.toJS).toDart;
  return result.toDart;
}


@JS('repertorioScoreCard.supported')
external JSBoolean _scoreShareSupported();

@JS('repertorioScoreCard.share')
external JSPromise<JSBoolean> _shareScore(
  JSNumber score,
  JSString archetype,
  JSString strengths,
  JSString shareUrl,
);

bool get viralScoreShareSupported => _scoreShareSupported().toDart;

Future<bool> shareViralScore({
  required int score,
  required String archetype,
  required String strengths,
  required String shareUrl,
}) async {
  if (!viralScoreShareSupported) {
    return false;
  }
  final result = await _shareScore(
    score.toJS,
    archetype.toJS,
    strengths.toJS,
    shareUrl.toJS,
  ).toDart;
  return result.toDart;
}
