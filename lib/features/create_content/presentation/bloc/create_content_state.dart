import 'package:equatable/equatable.dart';

enum CreateContentStatus { initial, loading, success, failure }

class CreateContentState extends Equatable {
  final CreateContentStatus status;
  final String title;
  final String body;
  final String link;
  final String errorMessage;

  const CreateContentState({
    this.status = CreateContentStatus.initial,
    this.title = '',
    this.body = '',
    this.link = '',
    this.errorMessage = '',
  });

  CreateContentState copyWith({
    CreateContentStatus? status,
    String? title,
    String? body,
    String? link,
    String? errorMessage,
  }) {
    return CreateContentState(
      status: status ?? this.status,
      title: title ?? this.title,
      body: body ?? this.body,
      link: link ?? this.link,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [status, title, body, link, errorMessage];
}
