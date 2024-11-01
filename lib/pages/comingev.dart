import 'package:flutter/material.dart';
import 'events.dart'; // Import your events page

class CulturePage extends StatelessWidget {
  const CulturePage({super.key});

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              const Text(
                'Explore Algerian Culture',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 16),

              // Cultural Cards
              SizedBox(
                height: 150,
                child: GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  padding: const EdgeInsets.all(8.0),
                  childAspectRatio: 1,
                  children: [
                    _buildCulturalCard(context, 'Music', Icons.music_note),
                    _buildCulturalCard(context, 'Art', Icons.palette),
                    _buildCulturalCard(context, 'Cuisine', Icons.fastfood),
                  ],
                ),
              ),

              // Featured Articles Section
              const SizedBox(height: 24),
              const Text(
                'Featured Articles',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 8),
              Column(
                children: [
                  _buildArticleItem('Traditional Rai Music', 'lib/static/mir.jpeg'),
                  _buildArticleItem('The Art of Algerian Carpets', 'lib/static/mir.jpeg'),
                  _buildArticleItem('Couscous: A Culinary Staple', 'lib/static/mir.jpeg'),
                ],
              ),

              const SizedBox(height: 24),
              const Text(
                'Interactive Gallery',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildGalleryItem('Traditional Dress', 'lib/static/mir.jpeg'),
                    _buildGalleryItem('Pottery Crafts', 'lib/static/mir.jpeg'),
                    _buildGalleryItem('Tlemcen Festival', 'lib/static/mir.jpeg'),
                    _buildGalleryItem('Algerian Jewelry', 'lib/static/mir.jpeg'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCulturalCard(BuildContext context, String title, IconData icon) {
    return GestureDetector(
      onTap: () {
        if (title == 'Music') {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const MusicEventsPage()),
          );
        }
      },
      child: Card(
        color: const Color.fromARGB(255, 76, 137, 117),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: Colors.white),
              const SizedBox(height: 10),
              Text(title, style: const TextStyle(color: Colors.white, fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildArticleItem(String title, String imagePath) {
    return Card(
      color: const Color.fromARGB(255, 76, 137, 117),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(imagePath, width: 100, height: 100, fit: BoxFit.cover),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(title, style: const TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGalleryItem(String title, String imagePath) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(imagePath, width: 150, height: 150, fit: BoxFit.cover),
          ),
          const SizedBox(height: 4),
          Text(title, style: const TextStyle(color: Colors.white, fontSize: 14)),
        ],
      ),
    );
  }
}
