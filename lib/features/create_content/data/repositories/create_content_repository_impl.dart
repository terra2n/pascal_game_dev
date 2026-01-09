import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../domain/repositories/create_content_repository.dart';
import '../datasources/create_content_remote_data_source.dart';

class CreateContentRepositoryImpl implements CreateContentRepository {
  final CreateContentRemoteDataSource remoteDataSource;

  CreateContentRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, bool>> createPost({
    required String title,
    required String body,
    String? link,
    List<String>? tags,
  }) async {
    try {
      final result = await remoteDataSource.createPost(
        title: title,
        body: body,
        link: link,
        tags: tags,
      );
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
