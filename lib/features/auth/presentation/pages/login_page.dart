import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/primary_button.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import '../widgets/auth_field.dart';
import '../widgets/auth_header.dart';
import '../widgets/gradient_scaffold.dart';
import '../widgets/social_login_section.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _rememberMe = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      // Gradient 2-Stop (Blue-Gold) specific for Login
      gradient: AppColors.goldGradient,
      // Gradient background handled by scaffold
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            children: [
              // 1. Header Widget
              const AuthHeader(),
              const SizedBox(height: 24),

              // White Card Container
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Title "Login"
                      const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF000957), 
                        ),
                      ),
                      const SizedBox(height: 8),
                      
                      // "Don't have an account? Sign Up"
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? ",
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                          GestureDetector(
                            onTap: () => context.push('/register'),
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(
                                color: Color(0xFF577BC1),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),

                      // 2. AuthField (Email)
                      AuthField(
                        label: 'Email',
                        hintText: 'Loisbecket@gmail.com',
                        controller: _emailController,
                      ),
                      const SizedBox(height: 16),

                      // 3. AuthField (Password)
                      AuthField(
                        label: 'Password',
                        hintText: '*******',
                        controller: _passwordController,
                        isPassword: true,
                      ),
                      const SizedBox(height: 16),

                      // Remember Me & Forgot Password
                      Row(
                        children: [
                          SizedBox(
                            height: 24,
                            width: 24,
                            child: Checkbox(
                              value: _rememberMe,
                              activeColor: const Color(0xFF577BC1),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                              onChanged: (val) {
                                setState(() {
                                  _rememberMe = val ?? false;
                                });
                              },
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Remember me',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              context.push('/forgot-password');
                            },
                            child: const Text(
                              "Forgot Password ?",
                              style: TextStyle(
                                color: Color(0xFF577BC1),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),

                      // Button Login
                      BlocConsumer<AuthBloc, AuthState>(
                        listener: (context, state) {
                           if (state is AuthFailure) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message), backgroundColor: Colors.red));
                           } else if (state is AuthSuccess) {
                             ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Login Success")));
                             context.go('/home');
                           }
                        },
                        builder: (context, state) {
                          return PrimaryButton(
                            text: 'Log In',
                            isLoading: state is AuthLoading,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                context.read<AuthBloc>().add(
                                  LoginRequested(
                                    email: _emailController.text,
                                    password: _passwordController.text
                                  )
                                );
                              }
                            },
                          );
                        },
                      ),

                      const SizedBox(height: 24),

                      // 4. Social Login Section
                      SocialLoginSection(
                        onGooglePressed: () {},
                        onFacebookPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
