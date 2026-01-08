import 'package:go_router/go_router.dart';
import '../features/auth/presentation/pages/register_page.dart';
import '../features/auth/presentation/pages/welcome_page.dart';
import '../features/auth/presentation/pages/login_page.dart';
import '../features/auth/presentation/pages/forgot_password_page.dart';
import '../features/auth/presentation/pages/verify_email_page.dart';
import '../features/home/presentation/pages/main_page.dart';
import '../core/constants/route_paths.dart';

// Definisi URL routing aplikasi
final appRouter = GoRouter(
  initialLocation: '/', // Halaman pertama kali dibuka
  routes: [
    GoRoute(
      path: RoutePaths.welcome,
      builder: (context, state) => const WelcomePage(),
    ),
    GoRoute(
      path: RoutePaths.login,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: RoutePaths.register,
      builder: (context, state) => const RegisterPage(),
    ),
    GoRoute(
      path: RoutePaths.forgotPassword,
      builder: (context, state) => const ForgotPasswordPage(),
    ),
    GoRoute(
      path: RoutePaths.verifyEmail,
      builder: (context, state) => VerifyEmailPage(email: state.extra as String?),
    ),
    GoRoute(
      path: RoutePaths.home,
      builder: (context, state) => const MainPage(),
    ),
  ],
);