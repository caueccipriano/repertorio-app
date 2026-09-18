import 'dart:js_interop';

@JS('repertorioOffline.supported')
external JSBoolean _supported();

@JS('repertorioOffline.cacheUrl')
external JSPromise<JSBoolean> _cacheUrl(JSString url);

@JS('repertorioOffline.removeUrl')
external JSPromise<JSBoolean> _removeUrl(JSString url);

bool get offlineMediaCacheSupported => _supported().toDart;

Future<bool> cacheOfflineMedia(List<String> urls) async {
  if (!offlineMediaCacheSupported) {
    return false;
  }

  var ok = true;
  for (final url in urls) {
    final result = await _cacheUrl(url.toJS).toDart;
    ok = ok && result.toDart;
  }
  return ok;
}

Future<void> removeOfflineMedia(List<String> urls) async {
  if (!offlineMediaCacheSupported) {
    return;
  }
  for (final url in urls) {
    await _removeUrl(url.toJS).toDart;
  }
}
