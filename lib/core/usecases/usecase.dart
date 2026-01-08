import 'package:dartz/dartz.dart';
import '../error/failures.dart';

// Type: Tipe data kembalian (misal: User)
// Params: Parameter input (misal: LoginParams berisi email & pass)
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams {}