import 'package:flutter/material.dart';

class MusicEventsPage extends StatelessWidget {
  const MusicEventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      backgroundColor: const Color.fromARGB(255, 76, 137, 117),
      title: const Text(
        'Music Events',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.account_circle,
            size: 30,
            color: Colors.white,
          ),
        ),
      ],
    );

    return Scaffold(
      appBar: appBar,
      backgroundColor: const Color.fromARGB(255, 33, 48, 43), // Dark green
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Upcoming Music Events',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            Column(
              children: [
                _buildEventItem(
                  'Rai Music Festival',
                  'Join us for a celebration of traditional Rai music featuring top artists.',
                  'Date: 15th November 2023',
                  'lib/static/mir.jpeg',
                ),
                _buildEventItem(
                  'Traditional Folk Music Night',
                  'Experience the enchanting sounds of traditional Algerian folk music.',
                  'Date: 22nd November 2023',
                  'lib/static/mir.jpeg',
                ),
                _buildEventItem(
                  'Jazz in the Casbah',
                  'A unique blend of jazz and Algerian music in the heart of Algiers.',
                  'Date: 30th November 2023',
                  'lib/static/mir.jpeg',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEventItem(String title, String description, String date, String imagePath) {
    return Card(
      color: const Color.fromARGB(255, 76, 137, 117), // Card color matches the theme
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(imagePath, width: 100, height: 100, fit: BoxFit.cover),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(description, style: const TextStyle(color: Colors.white)),
                  const SizedBox(height: 4),
                  Text(date, style: const TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
