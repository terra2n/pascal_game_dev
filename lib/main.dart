import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'routes/app_router.dart';

void main() {
  runApp(const PascalGameDevApp());
}

class PascalGameDevApp extends StatelessWidget {
  const PascalGameDevApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Menggunakan MaterialApp.router untuk GoRouter
    return MaterialApp.router(
      title: 'Pascal Game Dev',
      debugShowCheckedModeBanner: false,
      
      // Menggunakan tema dari file terpisah
      theme: AppTheme.lightTheme,
      
      // Konfigurasi Router
      routerConfig: appRouter,
    );
  }
}