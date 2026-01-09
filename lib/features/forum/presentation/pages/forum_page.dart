import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../injection_container.dart';
import '../bloc/forum_bloc.dart';
import '../bloc/forum_event.dart';
import '../bloc/forum_state.dart';
import '../widgets/category_chips.dart';
import '../widgets/thread_card.dart';

class ForumPage extends StatelessWidget {
  const ForumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ForumBloc>()..add(GetThreadsRequested()),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            // 1. Blue Background Base (Header)
            Container(
              height: 250, // Slightly shorter than Home
              width: double.infinity,
              color: AppColors.homeBackground,
            ),

            // 2. Yellow Accent Decoration
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  color: AppColors.accentYellow,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50), 
                  ),
                ),
              ),
            ),

            // 3. Main Content
            SafeArea(
              bottom: false,
              child: Column(
                children: [
                  // --- Header ---
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Forum Diskusi',
                                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Temukan solusi dan berbagi ilmu',
                                  style: TextStyle(
                                    color: Colors.white.withValues(alpha: 0.8),
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            // Search Icon
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(Icons.search_rounded, color: Colors.white, size: 24),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  // --- Body ---
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
                              // Categories
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 24.0),
                                child: Text(
                                  'Kategori',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 12),
                              const CategoryChips(),
                              const SizedBox(height: 24),

                              // Threads List
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 24.0),
                                child: Text(
                                  'Diskusi Terbaru',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),

                              BlocBuilder<ForumBloc, ForumState>(
                                builder: (context, state) {
                                  if (state is ForumLoading) {
                                    return const Center(child: Padding(
                                      padding: EdgeInsets.all(32.0),
                                      child: CircularProgressIndicator(),
                                    ));
                                  } else if (state is ForumError) {
                                    return Center(child: Padding(
                                      padding: const EdgeInsets.all(24.0),
                                      child: Text(state.message),
                                    ));
                                  } else if (state is ForumLoaded) {
                                    if (state.threads.isEmpty) {
                                       return const Center(child: Padding(
                                        padding: EdgeInsets.all(24.0),
                                        child: Text("Belum ada diskusi."),
                                      ));
                                    }
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // TODO: Implement Create Thread
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Fitur Buat Postingan belum tersedia')),
            );
          },
          backgroundColor: AppColors.primary,
          child: const Icon(Icons.add_comment_rounded),
        ),
      ),
    );
  }
}
