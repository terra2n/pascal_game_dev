import 'package:flutter/material.dart';

class AppColors {
  // --- Gradient Colors (Sesuai Request) ---
  // Stop 1 (0% - Top)
  static const Color gradientStart = Color(0xFF000957);
  // Stop 2 (50% - Middle)
  static const Color gradientMiddle = Color(0xFF1A2B87);
  // Stop 3 (100% - Bottom)
  static const Color gradientEnd = Color(0xFF577BC1);

  // --- Brand Colors ---
  // Kita gunakan warna terang dari gradient sebagai warna utama interaksi (tombol/link)
  static const Color primary = Color(0xFF577BC1); 
  static const Color secondary = Color(0xFF1A2B87);
  
  // Background Colors
  static const Color surface = Colors.white; // Untuk kartu/input field di atas gradient
  
  // Text Colors
  static const Color textPrimary = Color(0xFF212121); // Hitam (untuk di atas putih)
  static const Color textLight = Colors.white;        // Putih (untuk di atas gradient biru gelap)
  static const Color textSecondary = Color(0xFF757575);
  
  // Status Colors
  static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xFF388E3C);

  // Helper: Linear Gradient Definition
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.0, 0.5, 1.0],
    colors: [
      gradientStart,
      gradientMiddle,
      gradientEnd,
    ],
  );
}

