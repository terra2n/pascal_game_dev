import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/usecases/get_threads.dart';
import 'forum_event.dart';
import 'forum_state.dart';

class ForumBloc extends Bloc<ForumEvent, ForumState> {
  final GetThreads getThreads;

  ForumBloc({required this.getThreads}) : super(ForumInitial()) {
    on<GetThreadsRequested>(_onGetThreadsRequested);
  }

  Future<void> _onGetThreadsRequested(
    GetThreadsRequested event,
    Emitter<ForumState> emit,
  ) async {
    emit(ForumLoading());
    final result = await getThreads(NoParams());
    result.fold(
      (failure) => emit(ForumError(failure.message)),
      (threads) => emit(ForumLoaded(threads)),
    );
  }
}
