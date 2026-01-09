import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/tutorial_entity.dart';
import '../../domain/repositories/tutorial_repository.dart';
import '../datasources/tutorial_remote_data_source.dart';

class TutorialRepositoryImpl implements TutorialRepository {
  final TutorialRemoteDataSource remoteDataSource;

  TutorialRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<TutorialEntity>>> getTutorials() async {
    try {
      final remoteTutorials = await remoteDataSource.getTutorials();
      return Right(remoteTutorials);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
