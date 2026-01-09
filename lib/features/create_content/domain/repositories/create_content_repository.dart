import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';

abstract class CreateContentRepository {
  Future<Either<Failure, bool>> createPost({
    required String title,
    required String body,
    String? link,
    List<String>? tags,
  });
}
