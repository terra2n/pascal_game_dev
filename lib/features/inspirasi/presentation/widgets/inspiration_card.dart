import 'package:flutter/material.dart';
import '../../domain/entities/inspirasi_entity.dart';

class InspirationCard extends StatelessWidget {
  final InspirasiEntity inspiration;

  const InspirationCard({super.key, required this.inspiration});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[200], // Placeholder color
        borderRadius: BorderRadius.circular(20),
        image: inspiration.imageAsset.isNotEmpty
            ? DecorationImage(
                image: AssetImage(inspiration.imageAsset),
                fit: BoxFit.cover,
              )
            : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Gradient Overlay
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withValues(alpha: 0.7), // Darken bottom for text
                ],
              ),
            ),
          ),
          
          // Bookmark Icon
          Positioned(
            top: 16,
            right: 16,
            child: Icon(
              Icons.bookmark_border_rounded, // or bookmark_rounded for filled
              color: Colors.white.withValues(alpha: 0.8),
              size: 28,
            ),
          ),
          
          // Text Content (Bottom Left)
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  inspiration.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      inspiration.author,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.circle, size: 4, color: Colors.blue), // Dot separator
                    const SizedBox(width: 8),
                    Text(
                      inspiration.timestamp,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
