import 'package:equatable/equatable.dart';
import '../../domain/entities/thread_entity.dart';

abstract class ForumState extends Equatable {
  const ForumState();
  
  @override
  List<Object> get props => [];
}

class ForumInitial extends ForumState {}

class ForumLoading extends ForumState {}

class ForumLoaded extends ForumState {
  final List<ThreadEntity> threads;

  const ForumLoaded(this.threads);

  @override
  List<Object> get props => [threads];
}

class ForumError extends ForumState {
  final String message;

  const ForumError(this.message);

  @override
  List<Object> get props => [message];
}
