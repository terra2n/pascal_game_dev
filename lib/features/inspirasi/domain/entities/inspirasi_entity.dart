import 'package:equatable/equatable.dart';

class InspirasiEntity extends Equatable {
  final String id;
  final String title;
  final String author;
  final String imageAsset; // Using mock assets
  final String timestamp;

  const InspirasiEntity({
    required this.id,
    required this.title,
    required this.author,
    required this.imageAsset,
    required this.timestamp,
  });

  @override
  List<Object?> get props => [id, title, author, imageAsset, timestamp];
}
