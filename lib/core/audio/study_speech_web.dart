import 'dart:js_interop';

@JS('repertorioSpeech.supported')
external JSBoolean _supported();

@JS('repertorioSpeech.speak')
external JSPromise<JSBoolean> _speak(JSString text, JSNumber rate);

@JS('repertorioSpeech.stop')
external void _stop();

bool get studySpeechSupported => _supported().toDart;

Future<bool> speakStudyText(
  String text, {
  double rate = 1,
}) async {
  final result = await _speak(text.toJS, rate.toJS).toDart;
  return result.toDart;
}

void stopStudySpeech() => _stop();
