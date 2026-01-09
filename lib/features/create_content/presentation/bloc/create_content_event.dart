import 'package:equatable/equatable.dart';

abstract class CreateContentEvent extends Equatable {
  const CreateContentEvent();

  @override
  List<Object> get props => [];
}

class TitleChanged extends CreateContentEvent {
  final String title;

  const TitleChanged(this.title);

  @override
  List<Object> get props => [title];
}

class BodyChanged extends CreateContentEvent {
  final String body;

  const BodyChanged(this.body);

  @override
  List<Object> get props => [body];
}

class LinkChanged extends CreateContentEvent {
  final String link;

  const LinkChanged(this.link);

  @override
  List<Object> get props => [link];
}

class SubmitPostRequested extends CreateContentEvent {}
