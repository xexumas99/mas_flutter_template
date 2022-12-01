import 'package:url_launcher/url_launcher.dart';

Future launch(final String url) async {
  final uri = Uri.parse(url);
  final canLaunch = await canLaunchUrl(uri);

  if (canLaunch) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}
