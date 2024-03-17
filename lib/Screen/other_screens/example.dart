import 'package:flutter/material.dart';

class PhotoGallery extends StatelessWidget {
  final List<String> photoPaths = [
    'assets/images/Vendors_Venue_1.jpg',
    'assets/images/Vendors_Venue_1.jpg',
    'assets/images/Vendors_Venue_1.jpg',
    'assets/images/Vendors_Venue_1.jpg',
    // Add more photo paths as needed
  ];

  PhotoGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        spacing: 8.0, // Space between each photo
        runSpacing: 8.0, // Space between each row
        children: photoPaths
            .map((path) => PhotoItem(photoPath: path))
            .toList(), // Create a PhotoItem widget for each path
      ),
    );
  }
}

class PhotoItem extends StatelessWidget {
  final String photoPath;

  const PhotoItem({super.key, required this.photoPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2 -
          12.0, // Divide by the number of photos per row
      height: 200.0,
      // Adjust the height as needed
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(photoPath),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }
}
