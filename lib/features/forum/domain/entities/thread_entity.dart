import 'package:equatable/equatable.dart';

class ThreadEntity extends Equatable {
  final String id;
  final String title;
  final String content;
  final String author;
  final String category;
  final int likesCount;
  final int commentCount;
  final DateTime createdAt;

  const ThreadEntity({
    required this.id,
    required this.title,
    required this.content,
    required this.author,
    required this.category,
    required this.likesCount,
    required this.commentCount,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        content,
        author,
        category,
        likesCount,
        commentCount,
        createdAt,
      ];
}
