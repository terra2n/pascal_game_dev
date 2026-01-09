import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/route_paths.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/primary_button.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import '../widgets/gradient_scaffold.dart';

class VerifyEmailPage extends StatefulWidget {
  final String? email;
  const VerifyEmailPage({super.key, this.email});

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  // Controllers for 4 digit inputs
  final List<TextEditingController> _controllers = List.generate(4, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _onDigitChanged(String value, int index) {
    if (value.isNotEmpty && index < 3) {
      _focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      gradient: AppColors.goldGradient,
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Back Button
                      GestureDetector(
                        onTap: () => context.pop(),
                        child: const Icon(Icons.arrow_back, color: Colors.black),
                      ),
                      const SizedBox(height: 16),

                      // Header "Verify Email"
                      const Text(
                        'Verify Email',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF000957), // Dark Blue
                        ),
                      ),
                      const SizedBox(height: 8),

                      // Description
                      Text(
                        'Please enter the 4 digit code sent to your email address.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 32),

                      // OTP Input Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(4, (index) {
                          return SizedBox(
                            width: 60,
                            height: 60,
                            child: TextFormField(
                              controller: _controllers[index],
                              focusNode: _focusNodes[index],
                              onChanged: (value) => _onDigitChanged(value, index),
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey[100],
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(color: AppColors.primary, width: 2),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 32),

                      // Verify Button
                      BlocConsumer<AuthBloc, AuthState>(
                        listener: (context, state) {
                          if (state is AuthFailure) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(state.message), backgroundColor: Colors.red),
                            );
                          } else if (state is AuthSuccess) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Email Verified Successfully")),
                            );
                            // Navigate to Dashboard or Login based on flow
                            context.go(RoutePaths.login); 
                          }
                        },
                        builder: (context, state) {
                          return PrimaryButton(
                            text: 'Verify',
                            isLoading: state is AuthLoading,
                            onPressed: () {
                              String code = _controllers.map((c) => c.text).join();
                              if (code.length == 4) {
                                if (widget.email != null) {
                                  context.read<AuthBloc>().add(
                                    VerifyEmailRequested(email: widget.email!, code: code),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text("Email not found"), backgroundColor: Colors.red),
                                  );
                                }
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text("Please enter full 4 digit code"), backgroundColor: Colors.red),
                                );
                              }
                            },
                          );
                        },
                      ),
                      
                      const SizedBox(height: 24),
                      Center(
                        child: GestureDetector(
                           onTap: () {
                             if (widget.email != null) {
                               // Reuse ForgotPasswordRequested to resend code as it triggers same behavior
                               context.read<AuthBloc>().add(ForgotPasswordRequested(email: widget.email!));
                               ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Resending Code...")));
                             }
                           },
                           child: const Text(
                             "Resend Code",
                             style: TextStyle(
                               color: Color(0xFF577BC1),
                               fontWeight: FontWeight.bold,
                               decoration: TextDecoration.underline,
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
        ),
      ),
    );
  }
}
