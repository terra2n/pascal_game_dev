import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainWrapperPage extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  const MainWrapperPage({
    super.key,
    required this.navigationShell,
  });

  @override
  State<MainWrapperPage> createState() => _MainWrapperPageState();
}

class _MainWrapperPageState extends State<MainWrapperPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.navigationShell,
      
      // Floating Action Button di Tengah
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Tampilkan BottomSheet "Buat Konten"
          _showCreateContentSheet(context);
        },
        backgroundColor: const Color(0xFF6C63FF),
        elevation: 4,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      
      // Bottom Navigation Bar
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10.0,
        height: 70,
        padding: EdgeInsets.zero,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // KIRI
            _buildNavItem(0, Icons.home_rounded, Icons.home_outlined, "Home"),
            _buildNavItem(1, Icons.lightbulb, Icons.lightbulb_outline, "Inspirasi"),
            
            // JARAK UNTUK FAB
            const SizedBox(width: 48),

            // KANAN
            _buildNavItem(2, Icons.school_rounded, Icons.school_outlined, "Tutorial"),
            _buildNavItem(3, Icons.forum_rounded, Icons.forum_outlined, "Forum"),
          ],
        ),
      ),
    );
  }

  // Fungsi Helper untuk Item Navigasi
  Widget _buildNavItem(int index, IconData activeIcon, IconData inactiveIcon, String label) {
    final bool isSelected = widget.navigationShell.currentIndex == index;
    
    return Expanded(
      child: InkWell(
        onTap: () => _goBranch(index),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isSelected ? activeIcon : inactiveIcon,
              color: isSelected ? const Color(0xFF6C63FF) : Colors.grey[400],
              size: 26,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                color: isSelected ? const Color(0xFF6C63FF) : Colors.grey[400],
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _goBranch(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  void _showCreateContentSheet(BuildContext context) {
      showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent, // Agar rounded corner terlihat
        builder: (context) {
          return Container(
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            height: 280,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 40, 
                    height: 4, 
                    decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                const SizedBox(height: 24),
                const Text("Mau buat apa hari ini?", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // BUTTON DISKUSI (LINKED)
                    GestureDetector(
                      onTap: () {
                        context.pop(); // Tutup sheet dulu
                        context.push('/create-post'); // Pindah ke halaman create
                      },
                      child: _buildActionItem(Icons.edit_note, "Diskusi", Colors.blue),
                    ),
                    
                    // BUTTON LAINNYA (Placeholder)
                    _buildActionItem(Icons.image_outlined, "Inspirasi", Colors.pink),
                    _buildActionItem(Icons.article_outlined, "Tutorial", Colors.orange),
                  ],
                )
              ],
            ),
          );
        },
      );
    }

  Widget _buildActionItem(IconData icon, String label, Color color) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: color.withOpacity(0.1),
          child: Icon(icon, color: color, size: 30),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
      ],
    );
  }
}