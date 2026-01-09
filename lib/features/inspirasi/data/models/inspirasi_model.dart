import '../../domain/entities/inspirasi_entity.dart';

class InspirasiModel extends InspirasiEntity {
  const InspirasiModel({
    required super.id,
    required super.title,
    required super.author,
    required super.imageAsset,
    required super.timestamp,
  });

  factory InspirasiModel.fromJson(Map<String, dynamic> json) {
    return InspirasiModel(
      id: json['id'],
      title: json['title'],
      author: json['author'],
      imageAsset: json['imageAsset'],
      timestamp: json['timestamp'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'imageAsset': imageAsset,
      'timestamp': timestamp,
    };
  }
}
