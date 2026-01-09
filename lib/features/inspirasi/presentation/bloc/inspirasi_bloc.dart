import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/usecases/get_inspirations.dart';
import 'inspirasi_event.dart';
import 'inspirasi_state.dart';

class InspirasiBloc extends Bloc<InspirasiEvent, InspirasiState> {
  final GetInspirations getInspirations;

  InspirasiBloc({required this.getInspirations}) : super(InspirasiInitial()) {
    on<GetInspirationsRequested>(_onGetInspirationsRequested);
  }

  Future<void> _onGetInspirationsRequested(
    GetInspirationsRequested event,
    Emitter<InspirasiState> emit,
  ) async {
    emit(InspirasiLoading());
    final result = await getInspirations(NoParams());
    result.fold(
      (failure) => emit(InspirasiError(failure.message)),
      (inspirations) => emit(InspirasiLoaded(inspirations)),
    );
  }
}
