import 'package:flutter/material.dart';

class PopularTopicCard extends StatelessWidget {
  final String title;
  final String postCount;
  final List<Color> gradientColors;

  const PopularTopicCard({
    super.key,
    required this.title,
    required this.postCount,
    required this.gradientColors,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: gradientColors.last.withValues(alpha: 0.4),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Decorative Circle (Top Left)
          Positioned(
            top: -20,
            left: -20,
            child: CircleAvatar(
              backgroundColor: Colors.white.withValues(alpha: 0.15),
              radius: 40,
            ),
          ),
          // Decorative Circle (Bottom Right)
          Positioned(
            bottom: -20,
            right: -20,
             child: CircleAvatar(
              backgroundColor: Colors.white.withValues(alpha: 0.15),
              radius: 40,
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '$postCount post',
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
