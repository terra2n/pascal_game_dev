import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../injection_container.dart';
import '../bloc/inspirasi_bloc.dart';
import '../bloc/inspirasi_event.dart';
import '../bloc/inspirasi_state.dart';
import '../widgets/inspiration_card.dart';

class InspirasiPage extends StatelessWidget {
  const InspirasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<InspirasiBloc>()..add(GetInspirationsRequested()),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. Header Row
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Menu Icon
                    IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () {},
                      icon: const Icon(Icons.menu_rounded, size: 28, color: Colors.black),
                    ),
                    
                    // Title
                    const Text(
                      'Inspirasi',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    
                    // Right Icons: Search & Avatar
                    Row(
                      children: [
                        const Icon(Icons.search, size: 28, color: Colors.black),
                        const SizedBox(width: 16),
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey[300], // Avatar Placeholder
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                
                const SizedBox(height: 32),
                
                // 2. Body List
                Expanded(
                  child: BlocBuilder<InspirasiBloc, InspirasiState>(
                    builder: (context, state) {
                      if (state is InspirasiLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is InspirasiError) {
                        return Center(child: Text(state.message));
                      } else if (state is InspirasiLoaded) {
                        return ListView.builder(
                          padding: const EdgeInsets.only(bottom: 24),
                          itemCount: state.inspirations.length,
                          itemBuilder: (context, index) {
                            return InspirationCard(inspiration: state.inspirations[index]);
                          },
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
