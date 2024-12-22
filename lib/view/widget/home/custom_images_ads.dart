import 'package:flutter/material.dart';

class CustomAdsImage extends StatelessWidget {
  final String imagePath;
  final String title;

  const CustomAdsImage({super.key, required this.imagePath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              imagePath,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          // Adding text on top of the image
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              title,  // Customize this text
              style: TextStyle(
                color: Colors.white,  // White color for contrast
                fontSize: 24,  // Adjust size as needed
                fontWeight: FontWeight.bold,  // Optional: Add bold style
              ),
            ),
          ),
        ],
      ),
    );;
  }
}
