import 'dart:js_interop';

@JS('repertorioSpotify.open')
external JSPromise<JSBoolean> _openSpotify(JSString url);

Future<bool> openSpotifyEmbed(String url) async {
  final result = await _openSpotify(url.toJS).toDart;
  return result.toDart;
}
