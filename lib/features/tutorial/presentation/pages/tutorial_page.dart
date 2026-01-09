import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../injection_container.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/usecases/get_tutorials.dart';
import '../bloc/tutorial_bloc.dart';
import '../bloc/tutorial_event.dart';
import '../bloc/tutorial_state.dart';
import '../widgets/tutorial_card.dart';

class TutorialPage extends StatelessWidget {
  const TutorialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<TutorialBloc>()..add(GetTutorialsRequested()),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () {},
                      icon: const Icon(Icons.menu_rounded, size: 28, color: Colors.black),
                    ),
                    const Text(
                      'Tutorial',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    Row(
                      children: const [
                        Icon(Icons.search, size: 28, color: Colors.black),
                        SizedBox(width: 16),
                        // Avatar placeholder
                        CircleAvatar(radius: 16, backgroundColor: Colors.grey),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                Expanded(
                  child: BlocBuilder<TutorialBloc, TutorialState>(
                    builder: (context, state) {
                      if (state is TutorialLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is TutorialError) {
                        return Center(child: Text(state.message));
                      } else if (state is TutorialLoaded) {
                        return ListView.builder(
                          padding: const EdgeInsets.only(bottom: 24),
                          itemCount: state.tutorials.length,
                          itemBuilder: (context, index) {
                            return TutorialCard(tutorial: state.tutorials[index]);
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
