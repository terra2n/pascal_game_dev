import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/tutorial_entity.dart';

abstract class TutorialRepository {
  Future<Either<Failure, List<TutorialEntity>>> getTutorials();
}
