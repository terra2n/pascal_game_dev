import 'package:equatable/equatable.dart';
import '../../domain/entities/tutorial_entity.dart';

abstract class TutorialState extends Equatable {
  const TutorialState();

  @override
  List<Object?> get props => [];
}

class TutorialInitial extends TutorialState {}

class TutorialLoading extends TutorialState {}

class TutorialLoaded extends TutorialState {
  final List<TutorialEntity> tutorials;

  const TutorialLoaded(this.tutorials);

  @override
  List<Object?> get props => [tutorials];
}

class TutorialError extends TutorialState {
  final String message;

  const TutorialError(this.message);

  @override
  List<Object?> get props => [message];
}
