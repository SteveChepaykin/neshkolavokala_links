import 'package:flutter/material.dart';
import 'package:neshkola_links/button.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkScreen extends StatelessWidget {
  LinkScreen({super.key});

  final Map<String, Map<String, dynamic>> links = {
    "YouTube": {
      "color": const Color(0xFFFF0000),
      "link": "https://www.youtube.com/@NeShkola-u2h",
    },
    "Instagram": {
      "color": const Color(0xFF000000),
      "link": "https://www.instagram.com/neshkolavokala_istra?igsh=NDI1cWcxYXVrcWNo&utm_source=qr",
      "gradient": const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFFF8BE66),
          Color(0xFFE04C5F),
          Color(0xFF6157C8),
        ],
      ),
    },
    "VK": {
      "color": const Color(0xFF0474FC),
      "link": "https://vk.com/neshkolavokalaistra",
    },
    "Telegram": {
      "color": const Color(0xFF2CA3EB),
      "link": "https://t.me/neshkola_vokala_istra",
    },
    "WhatsApp": {
      "color": const Color(0xFF24D364),
      "link": "https://wa.me/79252986649",
    },
  };

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/logo.png",
                  width: w < 600 ? w * 0.6 : w * 0.4,
                ),
                const SizedBox(
                  height: 20,
                ),
                ...links.keys.map(
                  (e) => SpecialElevatedButton(
                    bg: links[e]!["color"],
                    fg: Colors.white,
                    gradient: links[e]!["gradient"],
                    action: () => openLink(links[e]!["link"]),
                    child: Text(
                      e,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void openLink(String link) async {
    final Uri url = Uri.parse(link);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'can not launch a url';
    }
  }
}
