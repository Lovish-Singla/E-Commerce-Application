import 'package:ecom_fakestoreapi/widgets/EcomElevatedButton.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  void _launchURL(String url) async {
    Uri uri = Uri.parse(url);
    if (await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Developed by: Vish',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: EcomElevatedButton(
                    onPressed: () =>
                        _launchURL('https://github.com/Lovish-Singla'),
                    child: const Text('GitHub'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: EcomElevatedButton(
                    onPressed: () =>
                        _launchURL('https://linkedin.com/in/lovish-k-singla'),
                    child: const Text('LinkedIn'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Application Description',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'This application is an e-commerce platform that allows users to browse and purchase products from a fake store API.',
            ),
            const SizedBox(height: 16),
            const Text(
              'Dependencies Used',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () => _launchURL('https://pub.dev/packages/flutter'),
              child: const Text(
                '- Flutter',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
            GestureDetector(
              onTap: () =>
                  _launchURL('https://pub.dev/packages/cupertino_icons'),
              child: const Text(
                '- cupertino_icons',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
            GestureDetector(
              onTap: () => _launchURL('https://pub.dev/packages/http'),
              child: const Text(
                '- http',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
            GestureDetector(
              onTap: () => _launchURL('https://pub.dev/packages/shimmer'),
              child: const Text(
                '- shimmer',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
            GestureDetector(
              onTap: () => _launchURL('https://pub.dev/packages/url_launcher'),
              child: const Text(
                '- url_launcher',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
            // Add more dependencies as needed
          ],
        ),
      ),
    );
  }
}
