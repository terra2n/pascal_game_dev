import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/create_post.dart';
import 'create_content_event.dart';
import 'create_content_state.dart';

class CreateContentBloc extends Bloc<CreateContentEvent, CreateContentState> {
  final CreatePost createPost;

  CreateContentBloc({required this.createPost}) : super(const CreateContentState()) {
    on<TitleChanged>(_onTitleChanged);
    on<BodyChanged>(_onBodyChanged);
    on<LinkChanged>(_onLinkChanged);
    on<SubmitPostRequested>(_onSubmitPostRequested);
  }

  void _onTitleChanged(TitleChanged event, Emitter<CreateContentState> emit) {
    emit(state.copyWith(title: event.title));
  }

  void _onBodyChanged(BodyChanged event, Emitter<CreateContentState> emit) {
    emit(state.copyWith(body: event.body));
  }

  void _onLinkChanged(LinkChanged event, Emitter<CreateContentState> emit) {
    emit(state.copyWith(link: event.link));
  }

  Future<void> _onSubmitPostRequested(
    SubmitPostRequested event,
    Emitter<CreateContentState> emit,
  ) async {
    emit(state.copyWith(status: CreateContentStatus.loading));
    
    final result = await createPost(CreatePostParams(
      title: state.title,
      body: state.body,
      link: state.link,
      // tags: [] // Tags not implemented in logic yet
    ));

    result.fold(
      (failure) => emit(state.copyWith(
        status: CreateContentStatus.failure,
        errorMessage: failure.message,
      )),
      (_) => emit(state.copyWith(status: CreateContentStatus.success)),
    );
  }
}
