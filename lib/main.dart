import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/theme/app_theme.dart';
import 'injection_container.dart' as di; // Import alias 'di'
import 'routes/app_router.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';

void main() async {
  // 1. Pastikan binding flutter siap sebelum kode async lain
  WidgetsFlutterBinding.ensureInitialized();
  
  // 2. Inisialisasi Dependency Injection
  await di.init(); 

  // 3. Jalankan App
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MultiBlocProvider agar Bloc bisa diakses di seluruh aplikasi
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.sl<AuthBloc>(), // Ambil AuthBloc dari Service Locator
        ),
      ],
      child: MaterialApp.router(
        title: 'Pascal Game Dev Forum',
        debugShowCheckedModeBanner: false,
        
        // Setup Theme
        theme: AppTheme.lightTheme,
        
        // Setup Routing
        routerConfig: appRouter,
      ),
    );
  }
}