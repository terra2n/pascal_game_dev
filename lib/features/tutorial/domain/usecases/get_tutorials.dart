import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/tutorial_entity.dart';
import '../repositories/tutorial_repository.dart';

class GetTutorials implements UseCase<List<TutorialEntity>, NoParams> {
  final TutorialRepository repository;

  GetTutorials(this.repository);

  @override
  Future<Either<Failure, List<TutorialEntity>>> call(NoParams params) async {
    return await repository.getTutorials();
  }
}
