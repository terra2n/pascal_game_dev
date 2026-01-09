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

// Imports Feature Inspirasi
import 'features/inspirasi/data/datasources/inspirasi_remote_data_source.dart';
import 'features/inspirasi/data/repositories/inspirasi_repository_impl.dart';
import 'features/inspirasi/domain/repositories/inspirasi_repository.dart';
import 'features/inspirasi/domain/usecases/get_inspirations.dart';
import 'features/inspirasi/presentation/bloc/inspirasi_bloc.dart';

// Imports Feature Tutorial
import 'features/tutorial/data/datasources/tutorial_remote_data_source.dart';
import 'features/tutorial/data/repositories/tutorial_repository_impl.dart';
import 'features/tutorial/domain/repositories/tutorial_repository.dart';
import 'features/tutorial/domain/usecases/get_tutorials.dart';
import 'features/tutorial/presentation/bloc/tutorial_bloc.dart';

// Imports Feature Create Content (Tambah)
import 'features/create_content/data/datasources/create_content_remote_data_source.dart';
import 'features/create_content/data/repositories/create_content_repository_impl.dart';
import 'features/create_content/domain/repositories/create_content_repository.dart';
import 'features/create_content/domain/usecases/create_post.dart';
import 'features/create_content/presentation/bloc/create_content_bloc.dart';

final sl = GetIt.instance; // sl singkatan dari Service Locator

Future<void> init() async {
  // ! Features - Auth
  await _initAuth();

  // ! Features - Forum
  await _initForum();

  // ! Features - Inspirasi
  await _initInspirasi();

  // ! Features - Tutorial
  await _initTutorial();

  // ! Features - Create Content
  await _initCreateContent();

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

Future<void> _initInspirasi() async {
  // 1. Bloc
  sl.registerFactory(
    () => InspirasiBloc(getInspirations: sl()),
  );

  // 2. Use Cases
  sl.registerLazySingleton(() => GetInspirations(sl()));

  // 3. Repository
  sl.registerLazySingleton<InspirasiRepository>(
    () => InspirasiRepositoryImpl(remoteDataSource: sl()),
  );

  // 4. Data Sources
  sl.registerLazySingleton<InspirasiRemoteDataSource>(
    () => InspirasiRemoteDataSourceImpl(),
  );
}

Future<void> _initTutorial() async {
  // 1. Bloc
  sl.registerFactory(
    () => TutorialBloc(getTutorials: sl()),
  );

  // 2. Use Cases
  sl.registerLazySingleton(() => GetTutorials(sl()));

  // 3. Repository
  sl.registerLazySingleton<TutorialRepository>(
    () => TutorialRepositoryImpl(remoteDataSource: sl()),
  );

  // 4. Data Sources
  sl.registerLazySingleton<TutorialRemoteDataSource>(
    () => TutorialRemoteDataSourceImpl(),
  );
}

Future<void> _initCreateContent() async {
  // 1. Bloc
  sl.registerFactory(
    () => CreateContentBloc(createPost: sl()),
  );

  // 2. Use Cases
  sl.registerLazySingleton(() => CreatePost(sl()));

  // 3. Repository
  sl.registerLazySingleton<CreateContentRepository>(
    () => CreateContentRepositoryImpl(remoteDataSource: sl()),
  );

  // 4. Data Sources
  sl.registerLazySingleton<CreateContentRemoteDataSource>(
    () => CreateContentRemoteDataSourceImpl(),
  );
}
