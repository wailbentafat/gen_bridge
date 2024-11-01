import 'package:flutter/material.dart';

class EventDetailPage extends StatelessWidget {
  final String title;
  final String summary;
  final String year;

   EventDetailPage({
    Key? key,
    required this.title,
    required this.summary,
    required this.year,
  }) : super(key: key);

 
  final List<Map<String, String>> quotes = [
    {
      'quote': 'La liberté est le droit de dire que deux et deux font quatre.',
      'author': 'Jean-Paul Sartre',
    },
    {
      'quote': 'Un peuple qui oublie son passé se condamne à le revivre.',
      'author': 'Ahmed Ben Bella',
    },
    {
      'quote': 'La guerre de libération nationale n’est pas seulement une guerre d’indépendance, c’est une guerre de libération.',
      'author': 'Houari Boumediène',
    },
    {
      'quote': 'La résistance est un devoir sacré.',
      'author': 'Abdelkader El Djezairi',
    },
    {
      'quote': 'L’Algérie est un pays où le sang des martyrs a nourri la terre de la liberté.',
      'author': 'Unknown',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 76, 137, 117),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        color: const Color.fromARGB(255, 33, 48, 43),
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                summary,
                style: const TextStyle(fontSize: 16, color: Colors.white70),
              ),
              const SizedBox(height: 16),
              Text(
                'Year: $year',
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
              const SizedBox(height: 16),

              // Display historical quotes
              const Text(
                'Historical Quotes',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              ...quotes.map((quote) {
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  color: const Color.fromARGB(255, 76, 137, 117),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '"${quote['quote']}"',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '- ${quote['author']}',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),

              // Display an image of Algeria's map
              const SizedBox(height: 16),
              const Text(
                'Map of Algeria',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                height: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/algeria_map.png'), // Add your image path here
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
