import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../../core/constants/route_paths.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/primary_button.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import '../widgets/auth_field.dart';
import '../widgets/gradient_scaffold.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _dobController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _dobController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _dobController.text = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      // Same Gold Gradient as Login Page for consistency or specific request
      gradient: AppColors.goldGradient,
      // AppBar removed/empty to allow full screen or just SafeArea
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Column(
              children: [
                // White Card
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                     boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Back Button
                        GestureDetector(
                          onTap: () => context.pop(),
                          child: const Icon(Icons.arrow_back, color: Colors.black),
                        ),
                        const SizedBox(height: 16),

                        // Header "Sign up"
                        const Text(
                          'Sign up',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF000957), // Dark Blue on White
                          ),
                        ),
                        const SizedBox(height: 8),

                        // "Already have an account? Login"
                        Row(
                          children: [
                            Text(
                              "Already have an account? ",
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                            GestureDetector(
                              onTap: () => context.push(RoutePaths.login), // Use push or go
                              child: const Text(
                                "Login",
                                style: TextStyle(
                                  color: Color(0xFF577BC1),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),

                        // Full Name
                        AuthField(
                          label: 'Full Name',
                          hintText: 'Lois Becket',
                          controller: _fullNameController,
                        ),
                        const SizedBox(height: 16),

                        // Email
                        AuthField(
                          label: 'Email',
                          hintText: 'Loisbecket@gmail.com',
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 16),

                        // Date of Birth
                        AuthField(
                          label: 'Date of Birth',
                          hintText: '18/03/2024',
                          controller: _dobController,
                          readOnly: true,
                          onTap: () => _selectDate(context),
                          suffix: const Icon(Icons.calendar_today_outlined, color: Colors.grey),
                        ),
                        const SizedBox(height: 16),

                        // Phone Number
                        AuthField(
                          label: 'Phone Number',
                          hintText: '(454) 726-0592',
                          controller: _phoneController,
                          keyboardType: TextInputType.phone,
                          prefix: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
                            margin: const EdgeInsets.only(right: 8.0),
                            decoration: const BoxDecoration(
                              border: Border(right: BorderSide(color: Colors.grey)), 
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                 const Text("🇬🇧", style: TextStyle(fontSize: 24)), 
                                 const SizedBox(width: 4),
                                 Icon(Icons.keyboard_arrow_down, color: Colors.grey[600], size: 18),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Password
                        AuthField(
                          label: 'Set Password',
                          hintText: '*******',
                          controller: _passwordController,
                          isPassword: true,
                        ),
                        const SizedBox(height: 32),

                        // Register Button
                        BlocConsumer<AuthBloc, AuthState>(
                          listener: (context, state) {
                            if (state is AuthFailure) {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message), backgroundColor: Colors.red));
                            } else if (state is AuthSuccess) {
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Registration Success")));
                              context.go(RoutePaths.login); 
                            }
                          },
                          builder: (context, state) {
                            return PrimaryButton(
                              text: 'Register',
                              isLoading: state is AuthLoading,
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  context.read<AuthBloc>().add(
                                    RegisterRequested(
                                      username: _fullNameController.text,
                                      email: _emailController.text,
                                      password: _passwordController.text,
                                    )
                                  );
                                }
                              },
                            );
                          },
                        ),
                      ],
                    ),
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
