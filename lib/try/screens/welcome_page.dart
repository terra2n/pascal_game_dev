import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Background Gradient Biru ke Kuning
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF000B4F), // Biru gelap atas
              Color(0xFF203A8E), // Biru tengah
              Color(0xFFDCE35B), // Kuning bawah
            ],
            stops: [0.0, 0.6, 1.0],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo PGD (Simulasi text style)
            Transform.rotate(
              angle: -0.2,
              child: const Column(
                children: [
                  Text(
                    "P",
                    style: TextStyle(
                      fontFamily: 'Serif',
                      fontSize: 80,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFFD700), // Emas
                      height: 0.8,
                    ),
                  ),
                   Text(
                    "G",
                    style: TextStyle(
                      fontFamily: 'Serif',
                      fontSize: 80,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFFD700),
                       height: 0.8,
                    ),
                  ),
                   Text(
                    "D",
                    style: TextStyle(
                      fontFamily: 'Serif',
                      fontSize: 80,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFFD700),
                       height: 0.8,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            // Tombol sementara untuk masuk (karena ini splash di desain asli)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/login'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: const Color(0xFF000B4F),
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text("Get Started", style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            )
          ],
        ),
      ),
    );
  }
}