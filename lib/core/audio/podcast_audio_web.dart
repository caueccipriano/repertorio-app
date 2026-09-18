import 'dart:js_interop';

@JS('repertorioAudio.open')
external JSBoolean _openAudio(
  JSString url,
  JSString title,
  JSString source,
);

Future<bool> openPodcastAudio({
  required String url,
  required String title,
  required String source,
}) async {
  return _openAudio(
    url.toJS,
    title.toJS,
    source.toJS,
  ).toDart;
}
