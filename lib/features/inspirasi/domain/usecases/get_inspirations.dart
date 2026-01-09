import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/inspirasi_entity.dart';
import '../repositories/inspirasi_repository.dart';

class GetInspirations implements UseCase<List<InspirasiEntity>, NoParams> {
  final InspirasiRepository repository;

  GetInspirations(this.repository);

  @override
  Future<Either<Failure, List<InspirasiEntity>>> call(NoParams params) async {
    return await repository.getInspirations();
  }
}
