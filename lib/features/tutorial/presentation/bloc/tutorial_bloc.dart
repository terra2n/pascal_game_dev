import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/usecases/get_tutorials.dart';
import 'tutorial_event.dart';
import 'tutorial_state.dart';

class TutorialBloc extends Bloc<TutorialEvent, TutorialState> {
  final GetTutorials getTutorials;

  TutorialBloc({required this.getTutorials}) : super(TutorialInitial()) {
    on<GetTutorialsRequested>(_onGetTutorialsRequested);
  }

  Future<void> _onGetTutorialsRequested(
    GetTutorialsRequested event,
    Emitter<TutorialState> emit,
  ) async {
    emit(TutorialLoading());
    final result = await getTutorials(NoParams());
    result.fold(
      (failure) => emit(TutorialError(failure.message)),
      (tutorials) => emit(TutorialLoaded(tutorials)),
    );
  }
}
