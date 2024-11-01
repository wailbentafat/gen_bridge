import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../pages/wilaya_info.dart'; // Make sure this file exists and contains the EventDetailPage

class InteractiveMap extends StatelessWidget {
  final List<Map<String, dynamic>> locations = [
    {
      'name': 'Algiers',
      'coordinates': LatLng(36.75, 3.06),
      'description': 'Capital city of Algeria, known for its Ottoman architecture.',
      'events': 'Cultural festivals, exhibitions.',
    },
    {
      'name': 'Oran',
      'coordinates': LatLng(35.5, -0.5),
      'description': 'A coastal city known for its beautiful beaches and vibrant culture.',
      'events': 'Music festivals, art shows.',
    },
    {
      'name': 'Constantine',
      'coordinates': LatLng(36.37, 6.61),
      'description': 'Known as the City of Bridges, famous for its dramatic cliffs.',
      'events': 'Historical reenactments, art exhibitions.',
    },
    {
      'name': 'Tlemcen',
      'coordinates': LatLng(34.88, -1.33),
      'description': 'A city rich in history and architecture, known for its cultural heritage.',
      'events': 'Cultural events, historical tours.',
    },
    {
      'name': 'Ghardaia',
      'coordinates': LatLng(32.48, 3.66),
      'description': 'A UNESCO World Heritage site known for its unique architecture and traditional crafts.',
      'events': 'Craft fairs, cultural festivals.',
    },
    {
      'name': 'Tamanrasset',
      'coordinates': LatLng(22.78, 5.52),
      'description': 'Gateway to the Sahara Desert, known for its stunning landscapes and Berber culture.',
      'events': 'Desert festivals, cultural events.',
    },
    {
      'name': 'Annaba',
      'coordinates': LatLng(36.9, 7.76),
      'description': 'A port city known for its historical significance and beautiful beaches.',
      'events': 'Marine events, cultural exhibitions.',
    },
    {
      'name': 'Bejaia',
      'coordinates': LatLng(36.75, 5.09),
      'description': 'A coastal city known for its beautiful Mediterranean beaches and historical sites.',
      'events': 'Beach festivals, cultural celebrations.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interactive Map of Algeria'),
      ),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(28.0339, 1.6596), 
          zoom: 5.0,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerLayerOptions(
            markers: locations.map((location) {
              return Marker(
                point: location['coordinates'],
                builder: (ctx) => GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => EventDetailPage(
                          title: location['name'],
                          description: location['description'],
                          events: location['events'],
                        ),
                      ),
                    );
                  },
                  child: const Icon(Icons.location_on, color: Colors.red, size: 40),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
