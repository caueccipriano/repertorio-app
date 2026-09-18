import 'package:url_launcher/url_launcher.dart';

Future<bool> openPodcastAudio({
  required String url,
  required String title,
  required String source,
}) async {
  final uri = Uri.tryParse(url);
  if (uri == null) return false;

  if (!uri.hasScheme ||
      (uri.scheme != 'https' && uri.scheme != 'http' && uri.scheme != 'spotify')) {
    return false;
  }

  // Installed iOS PWAs are stricter with embedded third-party players than
  // Safari tabs. Opening the Spotify/audio URL in a new external surface is
  // the most reliable path from standalone mode, while still preserving the
  // existing reader fallback if the browser refuses the launch.
  final external = await launchUrl(
    uri,
    mode: LaunchMode.externalApplication,
    webOnlyWindowName: '_blank',
  );
  if (external) return true;

  return launchUrl(
    uri,
    mode: LaunchMode.platformDefault,
    webOnlyWindowName: '_blank',
  );
}
