import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/inspirasi_entity.dart';

abstract class InspirasiRepository {
  Future<Either<Failure, List<InspirasiEntity>>> getInspirations();
}
