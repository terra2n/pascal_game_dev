import 'package:get_it/get_it.dart';

// Imports Feature Auth
import 'features/auth/data/datasources/auth_remote_data_source.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/domain/repositories/auth_repository.dart';
import 'features/auth/domain/usecases/login_user.dart';
import 'features/auth/domain/usecases/register_user.dart';
import 'features/auth/domain/usecases/forgot_password.dart';
import 'features/auth/domain/usecases/verify_email.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';

// Imports Feature Forum
import 'features/forum/data/datasources/forum_remote_data_source.dart';
import 'features/forum/data/repositories/forum_repository_impl.dart';
import 'features/forum/domain/repositories/forum_repository.dart';
import 'features/forum/domain/usecases/get_threads.dart';
import 'features/forum/presentation/bloc/forum_bloc.dart';

final sl = GetIt.instance; // sl singkatan dari Service Locator

Future<void> init() async {
  // ! Features - Auth
  await _initAuth();

  // ! Features - Forum
  await _initForum();

  // ! External
  // sl.registerLazySingleton(() => Dio());
}

Future<void> _initAuth() async {
  // 1. Bloc
  sl.registerFactory(
    () => AuthBloc(
      loginUser: sl(),
      registerUser: sl(),
      forgotPassword: sl(),
      verifyEmail: sl(),
    ),
  );

  // 2. Use Cases
  sl.registerLazySingleton(() => LoginUser(sl()));
  sl.registerLazySingleton(() => RegisterUser(sl()));
  sl.registerLazySingleton(() => ForgotPassword(sl()));
  sl.registerLazySingleton(() => VerifyEmail(sl()));

  // 3. Repository
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(remoteDataSource: sl()),
  );

  // 4. Data Sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(),
  );
}

Future<void> _initForum() async {
  // 1. Bloc
  sl.registerFactory(
    () => ForumBloc(getThreads: sl()),
  );

  // 2. Use Cases
  sl.registerLazySingleton(() => GetThreads(sl()));

  // 3. Repository
  sl.registerLazySingleton<ForumRepository>(
    () => ForumRepositoryImpl(remoteDataSource: sl()),
  );

  // 4. Data Sources
  sl.registerLazySingleton<ForumRemoteDataSource>(
    () => ForumRemoteDataSourceImpl(),
  );
}
