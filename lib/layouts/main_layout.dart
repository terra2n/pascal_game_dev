import 'package:flutter/material.dart';

class MainLayout extends StatelessWidget {
  final Widget child; // Konten spesifik halaman (misal: isi Dashboard)
  final int bottomNavIndex; // Tab mana yang aktif
  final Function(int)? onBottomNavTap; // Fungsi ketika tab ditekan
  final bool showBottomNav; // Opsi untuk menyembunyikan navigasi jika perlu

  const MainLayout({
    super.key,
    required this.child,
    this.bottomNavIndex = 0,
    this.onBottomNavTap,
    this.showBottomNav = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000B4F), // 1. Atur Warna Background Global disini
      body: Stack(
        children: [
          // 2. Elemen Layout Global: Aksen Kuning di Pojok Kanan Atas
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              width: 150,
              height: 150,
              decoration: const BoxDecoration(
                color: Color(0xFFDCE35B),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                ),
              ),
            ),
          ),
          
          // 3. Area Konten (Ini yang akan berubah-ubah tiap halaman)
          SafeArea(
            bottom: false, // Biarkan konten mengalir ke belakang navbar jika perlu
            child: child, 
          ),
        ],
      ),
      
      // 4. Navigasi Global
      bottomNavigationBar: showBottomNav 
          ? BottomNavigationBar(
              currentIndex: bottomNavIndex,
              onTap: onBottomNavTap,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.grey,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              elevation: 10,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
                BottomNavigationBarItem(icon: Icon(Icons.lightbulb_outline), label: "Ideas"),
                BottomNavigationBarItem(icon: Icon(Icons.add_circle_outline, size: 32), label: "Add"),
                BottomNavigationBarItem(icon: Icon(Icons.book_outlined), label: "Book"),
                BottomNavigationBarItem(icon: Icon(Icons.group_outlined), label: "People"),
              ],
            )
          : null,
    );
  }
}