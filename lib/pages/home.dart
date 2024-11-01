import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'search_result.dart'; 
import 'event.dart';
import '../widget/carousel.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  final List<Map<String, String>> imgList = [
    {
      'path': 'lib/static/hmd.jpeg',
      'title': 'Algerian War of Independence',
      'summary': 'The Algerian War of Independence against French colonial rule.',
      'year': '1954-1962',
    },
    {
      'path': 'lib/static/mir.jpeg',
      'title': 'Emir Abdelkader',
      'summary': 'Religious and military leader who led the struggle against the French.',
      'year': '1808-1883',
    },
  ];

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      backgroundColor: const Color.fromARGB(255, 33, 48, 43),
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
          Expanded(
            child: CarouselSlider(
              options: CarouselOptions(
                height: 300.0,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              ),
              items: imgList.map((item) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => EventDetailPage(
                          title: item['title']!,
                          summary: item['summary']!,
                          year: item['year']!,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[200],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        item['path']!,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 16),
          const QuickLinks(),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              onSubmitted: (query) {
                // Navigate to the SearchResultsPage with animation
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SearchResultsPage(query: query),
                ));
              },
              decoration: InputDecoration(
                hintText: 'Search',
                filled: true,
                fillColor: Colors.white,
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 76, 137, 117),
                    width: 2.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 76, 137, 117),
                    width: 2.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 76, 137, 117),
                    width: 2.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
