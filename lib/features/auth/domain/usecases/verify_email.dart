import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../repositories/auth_repository.dart';

class VerifyEmail {
  final AuthRepository repository;

  VerifyEmail(this.repository);

  Future<Either<Failure, void>> call(VerifyEmailParams params) async {
    return await repository.verifyEmail(
      email: params.email,
      code: params.code,
    );
  }
}

class VerifyEmailParams {
  final String email;
  final String code;

  VerifyEmailParams({required this.email, required this.code});
}
