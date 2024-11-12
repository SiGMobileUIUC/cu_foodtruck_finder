// pages.dart
import 'package:flutter/material.dart';

class CuisinesPage extends StatelessWidget {
  const CuisinesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> cuisines = ['Mexican', 'Italian', 'Chinese', 'Indian'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cuisines'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 3 / 2,
        ),
        itemCount: cuisines.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              print('Selected cuisine: ${cuisines[index]}');
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
              alignment: Alignment.center,
              child: Text(
                cuisines[index],
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map'),
      ),
      body: const Center(
        child: Icon(
          Icons.map,
          size: 150,
          color: Colors.grey,
        ), // Placeholder for a map widget
      ),
    );
  }
}

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('More'),
      ),
      body: const Center(
        child: Text('More options coming soon!'),
      ),
    );
  }
}
