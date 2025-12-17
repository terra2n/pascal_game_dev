import 'package:flutter/material.dart';
import '../widgets/topic_card.dart';
import '../widgets/post_item.dart';
import '../layouts/main_layout.dart'; // Import layout yang baru dibuat

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // 1. CARA MENGAMBIL UKURAN LAYAR HP (Lebar & Panjang)
    // Variabel ini akan berisi ukuran real-time dari HP yang sedang menjalankan aplikasi
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;

    // Bungkus konten dengan MainLayout
    return MainLayout(
      bottomNavIndex: _selectedIndex,
      onBottomNavTap: (index) => setState(() => _selectedIndex = index),
      child: Column(
        children: [
          // Header Custom (Isi spesifik Dashboard)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.menu, color: Colors.white, size: 30),
                    IconButton(
                      onPressed: (){}, 
                      icon: const Icon(Icons.notifications_outlined, color: Colors.black87)
                    ),
                  ],
                ),
                // Menggunakan jarak dinamis (2% dari tinggi layar), bukan fix pixel
                SizedBox(height: screenHeight * 0.02),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Hi, Janokk",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        // Contoh membatasi lebar teks agar tidak menabrak ikon di layar kecil
                        SizedBox(
                          width: screenWidth * 0.6, // Lebar maksimal 60% dari lebar layar
                          child: const Text(
                            "Find topics that you like to read",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.search, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),

          // Bagian Putih (Body)
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Chip Kategori
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(4, (index) => 
                          Container(
                            margin: const EdgeInsets.only(right: 12),
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.blue.shade50,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              "New Topic",
                              style: TextStyle(
                                color: Colors.blue.shade700,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Popular Topics
                    const Text(
                      "Populer Topics",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          TopicCard(
                            title: "Game",
                            postCount: "30",
                            gradientColors: const [Color(0xFF9C2CF3), Color(0xFF3A49F9)],
                            onTap: () {},
                          ),
                          TopicCard(
                            title: "Dev",
                            postCount: "30",
                            gradientColors: const [Color(0xFF3A49F9), Color(0xFF2F3C7E)],
                            onTap: () {},
                          ),
                          TopicCard(
                            title: "Code",
                            postCount: "30",
                            gradientColors: const [Color(0xFF4CA1AF), Color(0xFF2C3E50)],
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Trending Post
                    const Text(
                      "Treding Post",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    
                    const PostItem(
                      userName: "Ngoding pascal",
                      title: "Ngoding Pascal",
                      timeAgo: "2d ago",
                      content: "30 post i'm using python for work ananian fil hamim, wa la ansa an astahim fil hamma using library for study ......",
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}