import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MentalHealthResourcesPage extends StatelessWidget {
  const MentalHealthResourcesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mental Health Resources'),
        backgroundColor: const Color.fromARGB(255, 80, 165, 94),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Mental Health Resources',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Here are some resources for mental health support and information:',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 20),
            _buildResourceLink(
              'Trauma Informed Yoga',
              'https://www.exhaletoinhale.org/classes/',
            ),
            const SizedBox(height: 20),
            _buildResourceLink(
              'National Institute of Mental Health (NIMH)',
              'https://www.nimh.nih.gov/',
            ),
            const SizedBox(height: 20),
            _buildResourceLink(
              'MentalHealth.gov',
              'https://www.mentalhealth.gov/',
            ),
            const SizedBox(height: 20),
            _buildResourceLink(
              'Crisis Text Line',
              'https://www.crisistextline.org/',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResourceLink(String title, String url) {
    return InkWell(
      onTap: () => _launchUrl(url),
      child: Text(
        title,
        style: const TextStyle(
          color: Color.fromARGB(255, 5, 32, 83),
          fontSize: 18,
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
