import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/thread_entity.dart';
import '../repositories/forum_repository.dart';

class GetThreads implements UseCase<List<ThreadEntity>, NoParams> {
  final ForumRepository repository;

  GetThreads(this.repository);

  @override
  Future<Either<Failure, List<ThreadEntity>>> call(NoParams params) async {
    return await repository.getThreads();
  }
}
