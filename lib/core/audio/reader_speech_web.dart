import 'dart:js_interop';

@JS('repertorioSpeech.speak')
external JSPromise<JSBoolean> _speak(JSString text, JSNumber rate);

@JS('repertorioSpeech.stop')
external void _stop();

Future<bool> speakReaderText({
  required String text,
  double rate = 1.0,
}) async {
  final result = await _speak(text.toJS, rate.toJS).toDart;
  return result.toDart;
}

void stopReaderSpeech() => _stop();
