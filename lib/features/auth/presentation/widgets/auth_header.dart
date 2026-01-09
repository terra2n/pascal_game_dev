import 'package:flutter/material.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Pascal Game Development',
      style: TextStyle(
        fontFamily: 'Serif', 
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Color(0xFFFFD700), // Gold
        shadows: [
          Shadow(
            color: Colors.black45, 
            offset: Offset(1, 1), 
            blurRadius: 2,
          ),
        ],
      ),
    );
  }
}
