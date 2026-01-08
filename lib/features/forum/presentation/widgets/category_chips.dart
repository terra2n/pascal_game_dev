import 'package:flutter/material.dart';


class CategoryChips extends StatelessWidget {
  const CategoryChips({super.key});

  @override
  Widget build(BuildContext context) {
    // "All" removed, and list updated
    final categories = ['New Topic', 'Popular', 'Trending', 'Unity', 'Unreal', 'Godot'];
    
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 24), // Match page padding
        itemCount: categories.length,
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemBuilder: (context, index) {

          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              // Light Blue-Grey vs White/Transparent for others if needed, 
              // or just uniform style as per request "Color(0xFFF2F4F8)"
              color: const Color(0xFFF2F4F8), 
              borderRadius: BorderRadius.circular(12), // Rounded Rectangle
            ),
            child: Center(
              child: Text(
                categories[index],
                style: const TextStyle(
                  color: Color(0xFF6B7599), // Specific Blue-Grey Text
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
          );
        },
      ),
    );

  }
}
