import 'package:flutter/material.dart';
import 'quizpa.dart';
import 'event.dart';

class Pastev extends StatefulWidget {
  const Pastev({Key? key}) : super(key: key);

  @override
  _PastevState createState() => _PastevState();
}

class _PastevState extends State<Pastev> {
  final List<Map<String, String>> historicalEvents = [
    {
      'id': '1',
      'title': 'Algerian War of Independence',
      'summary': 'The Algerian War of Independence against French colonial rule.',
      'year': '1954-1962',
    },
    {
      'id': '2',
      'title': 'Emir Abdelkader',
      'summary': 'Religious and military leader who led the struggle against the French.',
      'year': '1808-1883',
    },
    {
      'id': '3',
      'title': 'Fatima N\'Soumer',
      'summary': 'Algerian Berber woman who led a resistance movement against French colonization.',
      'year': '1830-1863',
    },
  ];

  void onCardTap(Map<String, String> event) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EventDetailPage(
          title: event['title']!,
          summary: event['summary']!,
          year: event['year']!,
        ),
      ),
    );
  }

  void onQuizButtonTap(BuildContext context, Map<String, String> event) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QuizPage(title: event['title']!),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      backgroundColor: const Color.fromARGB(255, 33, 48, 43), // Match Bottom Navigation Bar
      title: const Text(
        'GEN-B',
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
      backgroundColor: const Color.fromARGB(255, 33, 48, 43),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(7.0),
            child: Text(
              'Historical Events',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: historicalEvents.length,
              itemBuilder: (context, index) {
                final event = historicalEvents[index];
                return Card(
                  margin: const EdgeInsets.all(16),
                  color: const Color.fromARGB(255, 76, 137, 117), // Match card color
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () => onCardTap(event),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                event['title']!,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                event['summary']!,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white70,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                event['year']!,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () => onQuizButtonTap(context, event),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: const Color.fromARGB(255, 76, 137, 117), // Button text color
                            backgroundColor: Colors.white,
                          ),
                          child: const Text('Take Quiz'),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
