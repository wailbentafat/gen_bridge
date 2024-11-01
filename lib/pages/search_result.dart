import 'package:flutter/material.dart';
import 'detail.dart'; // Import the DetailPage

class SearchResultsPage extends StatelessWidget {
  final String query;

  const SearchResultsPage({Key? key, required this.query}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> results = [
      {
        'title': 'Algerian War of Independence',
        'description': 'The Algerian War of Independence against French colonial rule.',
      },
      {
        'title': 'Emir Abdelkader',
        'description': 'Religious and military leader who led the struggle against the French.',
      },
      {
        'title': 'Traditional Rai Music',
        'description': 'A genre of music that originated in Algeria.',
      },
      {
        'title': 'Algerian Cuisine',
        'description': 'Rich and diverse culinary traditions.',
      },
      {
        'title': 'Algerian Art',
        'description': 'Includes traditional and contemporary art forms.',
      },
    ].where((item) => item['title']!.toLowerCase().contains(query.toLowerCase())).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 33, 48, 43),
        title: const Text('Search Results'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: results.isNotEmpty
            ? ListView.builder(
                itemCount: results.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: const Color.fromARGB(255, 76, 137, 117), // Match card color with the app theme
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text(
                        results[index]['title']!,
                        style: const TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        // Navigate to the detail page
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => DetailPage(
                              title: results[index]['title']!,
                              description: results[index]['description']!,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              )
            : Center(
                child: Text(
                  'No results found for "$query"',
                  style: const TextStyle(fontSize: 18, color: Colors.grey),
                ),
              ),
      ),
    );
  }
}
