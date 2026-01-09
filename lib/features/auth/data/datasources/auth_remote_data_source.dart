import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(String email, String password);
  Future<UserModel> register(String username, String email, String password);
  Future<void> forgotPassword(String email);
  Future<void> verifyEmail(String email, String code);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  // Nanti kita inject Dio di sini kalau backend sudah siap
  // final Dio dio; 
  // AuthRemoteDataSourceImpl({required this.dio});

  @override
  Future<UserModel> login(String email, String password) async {
    // Simulasi loading 2 detik
    await Future.delayed(const Duration(seconds: 2));

    // Simulasi Login Sukses (Hardcoded)
    if (email == 'test@email.com' && password == 'password') {
      return const UserModel(
        id: '12345',
        email: 'test@email.com',
        username: 'PascalDev',
        token: 'mock_jwt_token_abc123',
      );
    } else {
      // Simulasi Error
      throw Exception('Email atau password salah');
    }
  }

  @override
  Future<UserModel> register(String username, String email, String password) async {
    await Future.delayed(const Duration(seconds: 2));
    
    return UserModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      email: email,
      username: username,
      token: 'mock_jwt_token_register_123',
    );
  }

  @override
  Future<void> forgotPassword(String email) async {
    await Future.delayed(const Duration(seconds: 2));
    // Simulate Success
  }

  @override
  Future<void> verifyEmail(String email, String code) async {
    await Future.delayed(const Duration(seconds: 2));
    
    // Simulate Check Code
    if (code == "1234") {
      // Success
    } else {
      throw Exception("Invalid Verification Code");
    }
  }
}


