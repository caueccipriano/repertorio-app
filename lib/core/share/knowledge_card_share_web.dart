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
