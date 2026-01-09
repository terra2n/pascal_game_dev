

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../injection_container.dart';

import 'package:pascal_game_dev/features/forum/presentation/bloc/forum_bloc.dart';
import 'package:pascal_game_dev/features/forum/presentation/bloc/forum_event.dart';
import 'package:pascal_game_dev/features/forum/presentation/bloc/forum_state.dart';
import 'package:pascal_game_dev/features/forum/presentation/widgets/category_chips.dart';
import 'package:pascal_game_dev/features/forum/presentation/widgets/thread_card.dart';
import '../widgets/popular_topic_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ForumBloc>()..add(GetThreadsRequested()),
      child: Scaffold(
        backgroundColor: Colors.white, // Warna dasar paling bawah
        body: Stack(
        children: [
          // 1. Blue Background Base (Header Lebar)
          Container(
            height: 422, // Expanded header height
            width: double.infinity,
            color: AppColors.homeBackground,
          ),

          // 2. Yellow Accent Decoration (Top Right)
          Positioned(
            top: 0,
            right: 0,
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                // Yellow Layer (Background)
                Container(
                  width: 120,
                  height: 120,
                  decoration: const BoxDecoration(
                    color: AppColors.accentYellow,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                    ),
                  ),
                ),
                // Blue Layer (Overlay to create border effect)
                Container(
                  width: 105,
                  height: 105,
                  decoration: const BoxDecoration(
                    color: AppColors.homeBackground,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(45),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // 3. Main Content
          SafeArea(
            bottom: false, // Allow body to extend to bottom
            child: Column(
              children: [
                 // --- Header Section ---
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10), // Adjusted padding
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Top Row: Menu & Notification
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              Scaffold.of(context).openDrawer();
                            },
                            icon: const Icon(Icons.menu_rounded, color: Colors.white, size: 28),
                          ),
                          
                          // Ikon Notifikasi
                          const Icon(Icons.notifications_none_rounded, color: Color(0xFF000957), size: 28),
                        ],
                      ),
                      
                      const SizedBox(height: 30), // Increased spacing
                      
                      // Greeting & Search Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hi, Janokk', 
                                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8), // Adjusted spacing
                                Text(
                                  'Find topics that you like to read', 
                                  style: TextStyle(
                                    color: Colors.white.withValues(alpha: 0.8),
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 16),
                          // Ikon Search
                          const Icon(Icons.search_rounded, color: Colors.white, size: 28),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30), // Increased spacing before body

                  // --- White Body Container ---
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                      ),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.only(top: 24, bottom: 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              
                              // 1. Filter Chips (New Topic button etc)
                              const CategoryChips(),
                              
                              const SizedBox(height: 24),

                              // 2. Popular Topics
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 24),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Popular Topics',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.textPrimary,
                                      ),
                                    ),
                                    Text(
                                      'See All',
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 16),
                              
                              // Popular Topic Horizontal List
                              SizedBox(
                                height: 100, // Card height
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  padding: const EdgeInsets.symmetric(horizontal: 24),
                                  children: const [
                                    PopularTopicCard(
                                      title: 'Game',
                                      postCount: '30',
                                      gradientColors: [Color(0xFF8E2DE2), Color(0xFF4A00E0)],
                                    ),
                                     PopularTopicCard(
                                      title: 'Design',
                                      postCount: '12',
                                       gradientColors: [Color(0xFFF12711), Color(0xFFF5AF19)],
                                    ),
                                     PopularTopicCard(
                                      title: 'Code',
                                      postCount: '58',
                                       gradientColors: [Color(0xFF00C6FF), Color(0xFF0072FF)],
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(height: 24),

                              // 3. Trending Post (Feed)
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 24),
                                child: Text(
                                  'Trending Post',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),

                              // Feed List
                              BlocBuilder<ForumBloc, ForumState>(
                                builder: (context, state) {
                                  if (state is ForumLoading) {
                                    return const Center(child: Padding(
                                      padding: EdgeInsets.all(32.0),
                                      child: CircularProgressIndicator(),
                                    ));
                                  } else if (state is ForumError) {
                                    return Center(child: Text(state.message));
                                  } else if (state is ForumLoaded) {
                                    return ListView.builder(
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      padding: EdgeInsets.zero,
                                      itemCount: state.threads.length,
                                      itemBuilder: (context, index) {
                                        return ThreadCard(thread: state.threads[index]);
                                      },
                                    );
                                  }
                                  return const SizedBox();
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

      ),
    );
  }


}
