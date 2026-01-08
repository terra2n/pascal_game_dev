import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String email;
  final String username;
  final String? token; // Token Auth (JWT)

  const UserEntity({
    required this.id,
    required this.email,
    required this.username,
    this.token,
  });

  @override
  List<Object?> get props => [id, email, username, token];
}
