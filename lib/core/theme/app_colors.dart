import 'package:flutter/material.dart';

class AppColors {
  // --- Gradient Colors ---
  static const Color gradientBlueStop1 = Color(0xFF000957);
  static const Color gradientBlueStop2 = Color(0xFF1A2B87);
  static const Color gradientBlueStop3 = Color(0xFF577BC1);

  static const Color gradientGoldStop1 = Color(0xFF000957);
  static const Color gradientGoldStop2 = Color(0xFFEBE645);

  // --- Brand Colors ---
  static const Color primary = Color(0xFF577BC1); 
  static const Color secondary = Color(0xFF1A2B87);
  
  // Background Colors
  static const Color surface = Colors.white; 
  
  // Text Colors
  static const Color textPrimary = Color(0xFF212121); 
  static const Color textLight = Colors.white;        
  static const Color textSecondary = Color(0xFF757575);
  
  // Status Colors
  static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xFF388E3C);

  // Helper: Linear Gradient Definitions
  
  // 1. Blue Gradient (3 Stops)
  static const LinearGradient blueGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.0, 0.5, 1.0],
    colors: [
      gradientBlueStop1,
      gradientBlueStop2,
      gradientBlueStop3,
    ],
  );

  // 2. Gold Gradient (2 Stops)
  static const LinearGradient goldGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.0, 1.0],
    colors: [
      gradientGoldStop1,
      gradientGoldStop2,
    ],
  );
}

