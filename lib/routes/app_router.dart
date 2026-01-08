import 'package:go_router/go_router.dart';
import '../features/auth/presentation/pages/register_page.dart';
import '../features/auth/presentation/pages/welcome_page.dart';
import '../features/auth/presentation/pages/login_page.dart';
import '../features/auth/presentation/pages/forgot_password_page.dart';
import '../features/auth/presentation/pages/verify_email_page.dart';

// Definisi URL routing aplikasi
final appRouter = GoRouter(
  initialLocation: '/', // Halaman pertama kali dibuka
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const WelcomePage(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterPage(),
    ),
    GoRoute(
      path: '/forgot-password',
      builder: (context, state) => const ForgotPasswordPage(),
    ),
    GoRoute(
      path: '/verify-email',
      builder: (context, state) => VerifyEmailPage(email: state.extra as String?),
    ),
  ],
);