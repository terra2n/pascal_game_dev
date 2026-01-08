import 'package:flutter/material.dart';
import '../../domain/entities/thread_entity.dart';
import '../../../../core/theme/app_colors.dart';
import 'package:intl/intl.dart';

class ThreadCard extends StatelessWidget {
  final ThreadEntity thread;

  const ThreadCard({super.key, required this.thread});

  @override
  Widget build(BuildContext context) {
    /* 
      Requires 'intl' package for DateFormat. 
      Ensure it's in pubspec.yaml (checked earlier, it is).
    */
    final formattedDate = DateFormat.yMMMd().format(thread.createdAt);

    return Container(
      margin: const EdgeInsets.only(bottom: 12, left: 16, right: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            offset: const Offset(0, 2), // Smaller offset
            blurRadius: 4, // Smaller blur (flatter)
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Author (Tag Removed)
          Row(
            children: [
              CircleAvatar(
                radius: 12,
                backgroundColor: Colors.grey[200],
                backgroundImage: const AssetImage('assets/images/user_placeholder.png'), // Fallback
                child: const Icon(Icons.person, size: 14, color: Colors.grey),
              ),
              const SizedBox(width: 8),
              Text(
                thread.author,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
              const Spacer(),
              Text(
                formattedDate,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 12),
          
          // Title
          Text(
            thread.title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: AppColors.textPrimary,
            ),
          ),
          
          const SizedBox(height: 8),
          
          // Content Preview
          Text(
            thread.content,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.textSecondary,
              height: 1.5,
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Footer (Likes, Comments, Views)
          Row(
            children: [
              _buildIconText(Icons.thumb_up_alt_outlined, "${thread.likesCount}"), // Like
              const SizedBox(width: 24), // Bigger spacing
              _buildIconText(Icons.chat_bubble_outline, "${thread.commentCount}"), // Comment
              const SizedBox(width: 24),
              _buildIconText(Icons.remove_red_eye_outlined, "1.2k"), // Dummy Views (Eye)
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIconText(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey[600]),
        const SizedBox(width: 4),
        Text(
          text,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
