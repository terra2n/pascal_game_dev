import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/inspirasi_entity.dart';
import '../../domain/repositories/inspirasi_repository.dart';
import '../datasources/inspirasi_remote_data_source.dart';

class InspirasiRepositoryImpl implements InspirasiRepository {
  final InspirasiRemoteDataSource remoteDataSource;

  InspirasiRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<InspirasiEntity>>> getInspirations() async {
    try {
      final remoteInspirations = await remoteDataSource.getInspirations();
      return Right(remoteInspirations);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
