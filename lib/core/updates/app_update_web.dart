import 'dart:js_interop';

@JS('repertorioUpdates.check')
external JSPromise<JSBoolean> _check();

@JS('repertorioUpdates.apply')
external JSPromise<JSAny?> _apply();

Future<bool> checkAppUpdate() async {
  final result = await _check().toDart;
  return result.toDart;
}

Future<void> applyAppUpdate() async {
  await _apply().toDart;
}
