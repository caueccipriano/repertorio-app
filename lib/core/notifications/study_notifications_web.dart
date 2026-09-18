import 'dart:js_interop';

@JS('repertorioNotifications.requestPermission')
external JSPromise<JSString> _requestPermission();

@JS('repertorioNotifications.permission')
external JSString _permission();

@JS('repertorioNotifications.show')
external void _showNotification(JSString title, JSString body);

Future<bool> requestStudyNotificationPermission() async {
  final permission = await _requestPermission().toDart;
  return permission.toDart == 'granted';
}

bool get studyNotificationPermissionGranted =>
    _permission().toDart == 'granted';

bool get studyNotificationsSupported =>
    _permission().toDart != 'unsupported';

void showStudyNotification({
  required String title,
  required String body,
}) {
  if (!studyNotificationPermissionGranted) {
    return;
  }
  _showNotification(title.toJS, body.toJS);
}
