import '../../domain/entities/tutorial_entity.dart';

class TutorialModel extends TutorialEntity {
  const TutorialModel({
    required super.id,
    required super.title,
    required super.category,
    required super.author,
    required super.authorAvatar,
    required super.imageAsset,
    required super.description,
    required super.timestamp,
  });

  factory TutorialModel.fromJson(Map<String, dynamic> json) {
    return TutorialModel(
      id: json['id'],
      title: json['title'],
      category: json['category'],
      author: json['author'],
      authorAvatar: json['authorAvatar'],
      imageAsset: json['imageAsset'],
      description: json['description'],
      timestamp: json['timestamp'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'category': category,
      'author': author,
      'authorAvatar': authorAvatar,
      'imageAsset': imageAsset,
      'description': description,
      'timestamp': timestamp,
    };
  }
}
