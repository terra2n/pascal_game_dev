import 'package:dio/dio.dart';
import '../../../../core/error/exceptions.dart';
import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(String email, String password);
  Future<UserModel> register(String username, String email, String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;

  // Dio should be configured with BaseUrl in dependency injection
  AuthRemoteDataSourceImpl({required this.dio});

  @override
  Future<UserModel> login(String email, String password) async {
    try {
      final response = await dio.post(
        '/auth/login',
        data: {
          'email': email,
          'password': password,
        },
      );
      
      // Assuming response.data is the JSON map of the user
      // Adjust based on actual API response structure (e.g. response.data['data'])
      return UserModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException(e.message ?? 'Unknown Server Error');
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserModel> register(String username, String email, String password) async {
    try {
      final response = await dio.post(
        '/auth/register',
        data: {
          'username': username,
          'email': email,
          'password': password,
        },
      );
      return UserModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException(e.message ?? 'Unknown Server Error');
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
