import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/thread_entity.dart';
import '../../domain/repositories/forum_repository.dart';
import '../datasources/forum_remote_data_source.dart';

class ForumRepositoryImpl implements ForumRepository {
  final ForumRemoteDataSource remoteDataSource;

  ForumRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<ThreadEntity>>> getThreads() async {
    try {
      final remoteThreads = await remoteDataSource.getThreads();
      return Right(remoteThreads);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
