import 'package:go_router/go_router.dart';
import '../features/auth/presentation/pages/welcome_page.dart';
import '../features/auth/presentation/pages/login_page.dart';

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
    // Todo: Buat halaman RegisterPage nanti
    GoRoute(
      path: '/register',
      // Sementara arahkan ke Login dulu untuk testing navigasi
      builder: (context, state) => const LoginPage(), 
    ),
  ],
);