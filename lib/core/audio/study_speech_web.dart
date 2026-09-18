import 'dart:js_interop';

@JS('repertorioSpeech.supported')
external JSBoolean _supported();

@JS('repertorioSpeech.speak')
external JSPromise<JSString> _speak(JSString text, JSNumber rate);

@JS('repertorioSpeech.stop')
external void _stop();

bool get studySpeechSupported => _supported().toDart;

Future<void> speakStudyText(
  String text, {
  double rate = 1,
}) async {
  await _speak(text.toJS, rate.toJS).toDart;
}

void stopStudySpeech() => _stop();
