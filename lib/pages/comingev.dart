import 'package:flutter/material.dart';

class CulturePage extends StatelessWidget {
  const CulturePage({Key? key}) : super(key: key);

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
      backgroundColor: const Color.fromARGB(255, 33, 48, 43), // Dark green
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Cultural Aspects Section
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Explore Algerian Culture',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              padding: const EdgeInsets.all(8.0),
              childAspectRatio: 1,
              children: [
                _buildCulturalCard('Music', Icons.music_note),
                _buildCulturalCard('Art', Icons.palette),
                _buildCulturalCard('Cuisine', Icons.fastfood),
              ],
            ),

            // Featured Articles Section
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Featured Articles',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            Column(
              children: [
                _buildArticleItem('Traditional Rai Music', '../static/hmd.jpeg'),
                _buildArticleItem('The Art of Algerian Carpets', '../static/hmd.jpeg'),
                _buildArticleItem('Couscous: A Culinary Staple', '../static/hmd.jpeg'),
              ],
            ),

            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Interactive Gallery',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildGalleryItem('Traditional Dress', 'assets/dress.jpg'),
                  _buildGalleryItem('Pottery Crafts', 'assets/pottery.jpg'),
                  _buildGalleryItem('Tlemcen Festival', 'assets/festival.jpg'),
                  _buildGalleryItem('Algerian Jewelry', 'assets/jewelry.jpg'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCulturalCard(String title, IconData icon) {
    return Card(
      color: const Color.fromARGB(255, 76, 137, 117), // Card color
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
    );
  }

  Widget _buildArticleItem(String title, String imagePath) {
    return Card(
      color: const Color.fromARGB(255, 76, 137, 117), // Card color
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: [
          Image.asset(imagePath, width: 100, height: 100, fit: BoxFit.cover),
          const SizedBox(width: 8),
          Expanded(child: Text(title, style: const TextStyle(color: Colors.white))),
        ],
      ),
    );
  }

  Widget _buildGalleryItem(String title, String imagePath) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
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
