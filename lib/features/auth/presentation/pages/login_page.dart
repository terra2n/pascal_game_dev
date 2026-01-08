import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/primary_button.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.primaryGradient,
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Welcome Back',
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary,
                            ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Login to your account',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      const SizedBox(height: 32),
                      CustomTextField(
                        controller: _emailController,
                        hintText: 'Email',
                        prefixIcon: Icons.email,
                        validator: (value) =>
                            value!.isEmpty ? 'Please enter email' : null,
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        controller: _passwordController,
                        hintText: 'Password',
                        isPassword: true,
                        prefixIcon: Icons.lock,
                        validator: (value) =>
                            value!.isEmpty ? 'Please enter password' : null,
                      ),
                      const SizedBox(height: 24),
                      BlocConsumer<AuthBloc, AuthState>(
                        listener: (context, state) {
                          if (state is AuthFailure) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(state.message, style: const TextStyle(color: Colors.white)), backgroundColor: Colors.red),
                            );
                          } else if (state is AuthSuccess) {
                             // Navigate to Home
                             // For now just show snackbar or navigate if router is ready
                             ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Login Success!'), backgroundColor: Colors.green),
                            );
                          }
                        },
                        builder: (context, state) {
                          return PrimaryButton(
                            text: 'Login',
                            isLoading: state is AuthLoading,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                context.read<AuthBloc>().add(
                                      AuthLoginRequested(
                                        email: _emailController.text,
                                        password: _passwordController.text,
                                      ),
                                    );
                              }
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 16),
                      TextButton(
                        onPressed: () {
                          context.push('/register');
                        },
                        child: const Text('Don\'t have an account? Register'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
