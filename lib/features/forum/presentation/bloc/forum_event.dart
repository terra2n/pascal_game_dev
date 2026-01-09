import 'package:equatable/equatable.dart';

abstract class ForumEvent extends Equatable {
  const ForumEvent();

  @override
  List<Object> get props => [];
}

class GetThreadsRequested extends ForumEvent {}
