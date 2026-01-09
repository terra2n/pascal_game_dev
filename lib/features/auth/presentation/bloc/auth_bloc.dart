import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/login_user.dart';
import '../../domain/usecases/register_user.dart';
import 'auth_event.dart';
import 'auth_state.dart';

import '../../domain/usecases/forgot_password.dart';
import '../../domain/usecases/verify_email.dart';
import '../../domain/entities/user_entity.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUser loginUser;
  final RegisterUser registerUser;
  final ForgotPassword forgotPassword;
  final VerifyEmail verifyEmail;

  AuthBloc({
    required this.loginUser,
    required this.registerUser,
    required this.forgotPassword,
    required this.verifyEmail,
  }) : super(AuthInitial()) {
    on<LoginRequested>(_onLoginRequested);
    on<RegisterRequested>(_onRegisterRequested);
    on<ForgotPasswordRequested>(_onForgotPasswordRequested);
    on<VerifyEmailRequested>(_onVerifyEmailRequested);
  }

  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    
    final result = await loginUser(LoginParams(
      email: event.email,
      password: event.password,
    ));

    result.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (user) => emit(AuthSuccess(user)),
    );
  }

  Future<void> _onRegisterRequested(
    RegisterRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    final result = await registerUser(RegisterParams(
      username: event.username,
      email: event.email,
      password: event.password,
    ));

    result.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (user) => emit(AuthSuccess(user)),
    );
  }

  Future<void> _onForgotPasswordRequested(
    ForgotPasswordRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    final result = await forgotPassword(event.email);

    result.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (_) => emit(const AuthSuccess(UserEntity(id: '', email: '', username: '', token: ''))), // Use specific state ideally, but reusing AuthSuccess for generic success for now or create AuthActionSuccess
    );
  }

  Future<void> _onVerifyEmailRequested(
    VerifyEmailRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    final result = await verifyEmail(VerifyEmailParams(
      email: event.email,
      code: event.code,
    ));

    result.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (_) => emit(const AuthSuccess(UserEntity(id: '', email: '', username: '', token: ''))), 
    );
  }
}
