import 'package:flutter/material.dart';
import 'screens/welcome_page.dart';
import 'screens/login_page.dart';
import 'screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pascal Game Dev',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Menggunakan warna biru utama dari desain
        primaryColor: const Color(0xFF2D68F8), 
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
        fontFamily: 'Poppins', // Asumsi font yang mirip dengan desain
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFF2D68F8),
          secondary: const Color(0xFFDCE35B), // Warna kuning aksen
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomePage(),
        '/login': (context) => const LoginPage(),
        '/dashboard': (context) => const DashboardPage(),
      },
    );
  }
}