import 'package:equatable/equatable.dart';

class TutorialEntity extends Equatable {
  final String id;
  final String title;
  final String category;
  final String author;
  final String authorAvatar; // Asset path or URL
  final String imageAsset; // Hero image, can be empty
  final String description; // Short description
  final String timestamp;

  const TutorialEntity({
    required this.id,
    required this.title,
    required this.category,
    required this.author,
    required this.authorAvatar,
    required this.imageAsset,
    required this.description,
    required this.timestamp,
  });

  @override
  List<Object?> get props => [
    id, title, category, author, authorAvatar, imageAsset, description, timestamp
  ];
}
