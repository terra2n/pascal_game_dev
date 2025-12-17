import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _rememberMe = false;

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamedAndRemoveUntil(context, '/dashboard', (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // Mencegah background tergeser keyboard
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF000B4F), // Biru gelap
              Color(0xFF1A3282), 
              Color(0xFFDCE35B), // Kuning
            ],
            stops: [0.0, 0.4, 1.0],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 20),
              // Header Text Emas
              const Text(
                "Pascal Game Development",
                style: TextStyle(
                  color: Color(0xFFFFD700),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  shadows: [
                    Shadow(offset: Offset(1, 1), blurRadius: 2, color: Colors.black54)
                  ]
                ),
              ),
              const SizedBox(height: 30),
              
              // Kartu Login Putih
              Expanded(
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF000B4F),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Don't have an account? ", style: TextStyle(color: Colors.grey[600])),
                                GestureDetector(
                                  onTap: () {},
                                  child: const Text("Sign Up", style: TextStyle(color: Color(0xFF2D68F8), fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 30),
                          
                          // Input Email
                          const Text("Email", style: TextStyle(color: Colors.grey)),
                          const SizedBox(height: 8),
                          TextFormField(
                            initialValue: "Loisbecket@gmail.com",
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Colors.grey.shade300),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Colors.grey.shade300),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),

                          // Input Password
                          const Text("Password", style: TextStyle(color: Colors.grey)),
                          const SizedBox(height: 8),
                          TextFormField(
                            initialValue: "*******",
                            obscureText: true,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                              suffixIcon: const Icon(Icons.visibility_off_outlined, color: Colors.grey),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Colors.grey.shade300),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Colors.grey.shade300),
                              ),
                            ),
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
                                  onChanged: (val) => setState(() => _rememberMe = val!),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text("Remember me", style: TextStyle(color: Colors.grey[600])),
                              const Spacer(),
                              const Text("Forgot Password?", style: TextStyle(color: Color(0xFF2D68F8), fontWeight: FontWeight.bold)),
                            ],
                          ),
                          const SizedBox(height: 24),

                          // Tombol Login
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: _handleLogin,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF2D68F8),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                elevation: 0,
                              ),
                              child: const Text("Log In", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                            ),
                          ),

                          const SizedBox(height: 24),
                          Row(
                            children: [
                              Expanded(child: Divider(color: Colors.grey[300])),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                child: Text("Or", style: TextStyle(color: Colors.grey[400])),
                              ),
                              Expanded(child: Divider(color: Colors.grey[300])),
                            ],
                          ),
                          const SizedBox(height: 24),

                          // Social Buttons
                          _socialButton("Continue with Google", Colors.red),
                          const SizedBox(height: 12),
                          _socialButton("Continue with Facebook", Colors.blue),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _socialButton(String text, Color iconColor) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.circle, color: iconColor, size: 20), // Placeholder icon
          const SizedBox(width: 12),
          Text(text, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        ],
      ),
    );
  }
}