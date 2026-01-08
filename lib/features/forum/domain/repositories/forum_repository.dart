import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/thread_entity.dart';

abstract class ForumRepository {
  Future<Either<Failure, List<ThreadEntity>>> getThreads();
}
