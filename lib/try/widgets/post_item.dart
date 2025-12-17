import 'package:flutter/material.dart';

class PostItem extends StatelessWidget {
  final String userName;
  final String timeAgo;
  final String content;
  final String title;

  const PostItem({
    super.key,
    required this.userName,
    required this.timeAgo,
    required this.content,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header: Avatar & Nama
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey[300],
                // Placeholder avatar image
                child: const Icon(Icons.person, color: Colors.white),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userName,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    "Januar Al hakim  •  $timeAgo", // Meniru detail kecil di desain
                    style: TextStyle(color: Colors.grey[400], fontSize: 12),
                  ),
                ],
              ),
              const Spacer(),
              Icon(Icons.bookmark_border, color: Colors.grey[400]), // Icon bookmark di kanan
            ],
          ),
          const SizedBox(height: 12),
          // Isi Konten
          Text(
            content,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.black87,
              height: 1.5,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 16),
          // Statistik Bawah (Votes, Replies, Views)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _statItem(Icons.thumb_up_alt_outlined, "120 votes"),
              _statItem(Icons.chat_bubble_outline, "10 replies"),
              _statItem(Icons.remove_red_eye_outlined, "100 views"),
            ],
          )
        ],
      ),
    );
  }

  Widget _statItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey[400]),
        const SizedBox(width: 6),
        Text(
          text,
          style: TextStyle(color: Colors.grey[400], fontSize: 12),
        ),
      ],
    );
  }
}