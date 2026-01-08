import '../../domain/entities/thread_entity.dart';

class ThreadModel extends ThreadEntity {
  const ThreadModel({
    required super.id,
    required super.title,
    required super.content,
    required super.author,
    required super.category,
    required super.likesCount,
    required super.commentCount,
    required super.createdAt,
  });

  factory ThreadModel.fromJson(Map<String, dynamic> json) {
    return ThreadModel(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      author: json['author'],
      category: json['category'],
      likesCount: json['likes_count'],
      commentCount: json['comment_count'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'author': author,
      'category': category,
      'likes_count': likesCount,
      'comment_count': commentCount,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
