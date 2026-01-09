import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/create_content_repository.dart';

class CreatePost implements UseCase<bool, CreatePostParams> {
  final CreateContentRepository repository;

  CreatePost(this.repository);

  @override
  Future<Either<Failure, bool>> call(CreatePostParams params) async {
    return await repository.createPost(
      title: params.title,
      body: params.body,
      link: params.link,
      tags: params.tags,
    );
  }
}

class CreatePostParams extends Equatable {
  final String title;
  final String body;
  final String? link;
  final List<String>? tags;

  const CreatePostParams({
    required this.title,
    required this.body,
    this.link,
    this.tags,
  });

  @override
  List<Object?> get props => [title, body, link, tags];
}
