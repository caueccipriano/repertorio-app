import 'dart:js_interop';

@JS('repertorioAudio.open')
external JSPromise<JSBoolean> _openAudio(
  JSString url,
  JSString title,
  JSString source,
);

Future<bool> openPodcastAudio({
  required String url,
  required String title,
  required String source,
}) async {
  final result = await _openAudio(
    url.toJS,
    title.toJS,
    source.toJS,
  ).toDart;
  return result.toDart;
}
