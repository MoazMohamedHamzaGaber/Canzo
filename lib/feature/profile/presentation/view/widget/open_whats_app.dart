import 'package:url_launcher/url_launcher.dart';

Future<void> openWhatsApp() async {
  final phone = "201200892242"; // رقمك بدون +

  final url = Uri.parse("https://wa.me/$phone");

  if (await canLaunchUrl(url)) {
    await launchUrl(url, mode: LaunchMode.externalApplication);
  } else {
    throw "Could not launch WhatsApp";
  }
}