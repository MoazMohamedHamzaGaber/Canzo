import 'package:url_launcher/url_launcher.dart';

Future<void> openWhatsApp() async {
  final phone = "201200892242";

  final Uri url = Uri.parse("whatsapp://send?phone=$phone");

  if (await canLaunchUrl(url)) {
    await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    );
  } else {
    // fallback لو WhatsApp مش موجود
    final webUrl = Uri.parse("https://wa.me/$phone");

    if (await canLaunchUrl(webUrl)) {
      await launchUrl(
        webUrl,
        mode: LaunchMode.externalApplication,
      );
    } else {
      throw "WhatsApp not installed";
    }
  }
}