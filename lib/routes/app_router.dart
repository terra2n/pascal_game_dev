import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:pascal_game_dev/features/auth/presentation/pages/welcome_page.dart';
import 'package:pascal_game_dev/features/auth/presentation/pages/login_page.dart';
import 'package:pascal_game_dev/features/auth/presentation/pages/sign_up_page.dart';
import 'package:pascal_game_dev/features/auth/presentation/pages/forgot_password_page.dart';
import 'package:pascal_game_dev/features/auth/presentation/pages/verify_email_page.dart';

// Import Halaman Baru
import 'package:pascal_game_dev/features/home/presentation/pages/main_wrapper_page.dart';
import 'package:pascal_game_dev/features/home/presentation/pages/home_page.dart';
import 'package:pascal_game_dev/features/inspiration/presentation/pages/inspiration_page.dart';
import 'package:pascal_game_dev/features/tutorial/presentation/pages/tutorial_page.dart';
import 'package:pascal_game_dev/features/forum/presentation/pages/forum_page.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: <RouteBase>[
    // --- AUTH ROUTES ---
    GoRoute(path: '/', builder: (context, state) => const WelcomePage()),
    GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
    GoRoute(path: '/register', builder: (context, state) => const SignUpPage()),
    GoRoute(path: '/forgot-password', builder: (context, state) => const ForgotPasswordPage()),
    GoRoute(path: '/verify-email', builder: (context, state) => const VerifyEmailPage()),

    // --- MAIN APP (SHELL ROUTE) ---
    // Ini yang bikin Bottom Navigation tetap ada
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainWrapperPage(navigationShell: navigationShell);
      },
      branches: [
        // Tab 1: Home
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/home',
              builder: (context, state) => const HomePage(),
            ),
          ],
        ),
        // Tab 2: Inspirasi
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/inspiration',
              builder: (context, state) => const InspirationPage(),
            ),
          ],
        ),
        // Tab 3: Tutorial
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/tutorial',
              builder: (context, state) => const TutorialPage(),
            ),
          ],
        ),
        // Tab 4: Forum
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/forum',
              builder: (context, state) => const ForumPage(),
            ),
          ],
        ),
      ],
    ),
  ],
);