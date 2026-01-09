import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/user_entity.dart';

abstract class AuthRepository {
  // Kontrak fungsi Login
  Future<Either<Failure, UserEntity>> login({
    required String email,
    required String password,
  });

  // Kontrak fungsi Register
  Future<Either<Failure, UserEntity>> register({
    required String username,
    required String email,
    required String password,
  });

  // Kontrak fungsi Forgot Password
  Future<Either<Failure, void>> forgotPassword({
    required String email,
  });

  // Kontrak fungsi Verify Email
  Future<Either<Failure, void>> verifyEmail({
    required String email,
    required String code,
  });
}
