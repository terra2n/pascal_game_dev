import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../bloc/create_content_bloc.dart';
import '../bloc/create_content_event.dart';
import '../bloc/create_content_state.dart';

class CreateContentPage extends StatelessWidget {
  const CreateContentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<CreateContentBloc>(),
      child: const _CreateContentPageView(),
    );
  }
}

class _CreateContentPageView extends StatelessWidget {
  const _CreateContentPageView();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateContentBloc, CreateContentState>(
      listener: (context, state) {
        if (state.status == CreateContentStatus.success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Post published successfully!')),
          );
          // Navigate back or to the new post
          // context.go('/'); 
          // For now just show snackbar
        } else if (state.status == CreateContentStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage)),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.close, color: Colors.black),
              onPressed: () {
                // Handle close/cancel
              },
            ),
            backgroundColor: Colors.white,
            elevation: 0,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Center(
                  child: ElevatedButton(
                    onPressed: state.status == CreateContentStatus.loading
                        ? null
                        : () {
                          context.read<CreateContentBloc>().add(SubmitPostRequested());
                        },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[200], // Inactive style by default? 
                      // Or Blue if data is valid. For now, kept simple.
                      foregroundColor: Colors.grey,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: state.status == CreateContentStatus.loading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Text('Post'),
                  ),
                ),
              )
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets. all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title Input
                      TextField(
                        decoration: const InputDecoration(
                          hintText: 'Title',
                          hintStyle: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                          border: InputBorder.none,
                        ),
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        maxLines: null,
                        onChanged: (value) => context.read<CreateContentBloc>().add(TitleChanged(value)),
                      ),
                      
                      const SizedBox(height: 16),
                      
                      // Tags/Flair Button (Static for now)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          'Add tags & flair',
                          style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      
                      const SizedBox(height: 24),
                      
                      // Link Input (Optional)
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: const InputDecoration(
                                hintText: 'Enter link',
                                border: InputBorder.none,
                              ),
                              onChanged: (value) => context.read<CreateContentBloc>().add(LinkChanged(value)),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.close, color: Colors.grey),
                            onPressed: () {
                              // Clear link logic if needed
                            },
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: 16),
                      
                      // Body Text Input
                      TextField(
                        decoration: const InputDecoration(
                          hintText: 'body text',
                          border: InputBorder.none,
                        ),
                        maxLines: null,
                         onChanged: (value) => context.read<CreateContentBloc>().add(BodyChanged(value)),
                      ),
                    ],
                  ),
                ),
              ),
              
              // Bottom Toolbar
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: const BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.grey)),
                ),
                child: Row(
                  children: [
                    IconButton(onPressed: () {}, icon: const Icon(Icons.link)),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.image)),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.play_circle_outline)),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.poll_outlined)),
                    const Spacer(),
                    // Additional generic menu if needed
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
