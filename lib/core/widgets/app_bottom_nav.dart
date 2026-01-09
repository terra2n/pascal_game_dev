import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class AppBottomNav extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const AppBottomNav({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: onTap,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey[400],
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb_outline), // Inspirasi (Lampu)
            activeIcon: Icon(Icons.lightbulb),
            label: 'Inspirasi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined), // Tambah Konten (Gambar Tambah)
            activeIcon: Icon(Icons.add_box),
            label: 'Tambah',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_outlined), // Tutorial (Buku)
            activeIcon: Icon(Icons.menu_book),
            label: 'Tutorial',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline), // Forum (Gambar Orang)
            activeIcon: Icon(Icons.person),
            label: 'Forum',
          ),
        ],
      ),
    );
  }
}
