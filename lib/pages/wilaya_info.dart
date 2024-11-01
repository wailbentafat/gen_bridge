import 'package:flutter/material.dart';

class EventDetailPage extends StatelessWidget {
  final String title;
  final String description;
  final String events;

  const EventDetailPage({
    Key? key,
    required this.title,
    required this.description,
    required this.events,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              description,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            const Text(
              'Upcoming Events:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 8),
            Text(events),
          ],
        ),
      ),
    );
  }
}
