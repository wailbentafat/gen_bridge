import 'package:flutter/material.dart';

class Pastev extends StatelessWidget {
  // Sample data for historical events
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

  // Function to execute on card tap
  void onCardTap(Map<String, String> event) {
    // Handle the tap event (e.g., navigate to a details page)
    print('Tapped on: ${event['title']}');
    // You can also show a dialog or perform other actions here
  }

  // Function to execute when quiz button is tapped
  void onQuizButtonTap(Map<String, String> event) {
    // Handle quiz action here
    print('Starting quiz for: ${event['title']}');
    // Implement your quiz logic here
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      backgroundColor: const Color.fromARGB(255, 76, 137, 117),
      title: const Text(
        'GEN B',
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
                  color: const Color.fromARGB(255, 76, 137, 117),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () => onCardTap(event), // Handle tap
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
                          onPressed: () => onQuizButtonTap(event), // Quiz button tap
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black, backgroundColor: Colors.white, // Text color
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
