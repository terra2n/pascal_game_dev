import 'package:flutter/material.dart';
import '../widgets/discussion_card.dart';

class ForumPage extends StatelessWidget {
  const ForumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        title: const Text("Forum Diskusi", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 4,
        itemBuilder: (context, index) {
          return const DiscussionCard(
            authorName: "User Forum",
            timeAgo: "Baru saja",
            title: "Pertanyaan Diskusi Game Dev",
            content: "Bagaimana cara mengatasi bug physics di engine Godot 4 saat tabrakan?",
            category: "Godot",
            likes: 10,
            comments: 5,
          );
        },
      ),
    );
  }
}