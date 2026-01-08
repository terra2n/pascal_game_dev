import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../widgets/gradient_scaffold.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  
  @override
  void initState() {
    super.initState();
    // Timer 2 detik sebelum pindah ke Login
    Timer(const Duration(seconds: 2), () {
      if (mounted) {
        // Gunakan go() agar tidak bisa back ke splash
        context.go('/login');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      gradient: AppColors.blueGradient, // 3-Stop Blue
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // PGD Logo Image
            Image.asset(
              'assets/images/logo_icon.png',
              width: 150, // Adjust size as needed
              height: 150,
            ),
            // Opsional: text kecil di bawahnya (tidak diminta tapi bagus untuk detail)
          ],
        ),
      ),
    );
  }
}