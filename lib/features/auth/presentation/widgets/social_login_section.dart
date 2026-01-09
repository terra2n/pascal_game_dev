import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/widgets/social_button.dart';

class SocialLoginSection extends StatelessWidget {
  final VoidCallback onGooglePressed;
  final VoidCallback onFacebookPressed;

  const SocialLoginSection({
    super.key,
    required this.onGooglePressed,
    required this.onFacebookPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Divider(color: Colors.grey[300])),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text("Or", style: TextStyle(color: Colors.grey[500])),
            ),
            Expanded(child: Divider(color: Colors.grey[300])),
          ],
        ),
        const SizedBox(height: 24),
        SocialButton(
          text: "Continue with Google",
          icon: FontAwesomeIcons.google,
          iconColor: Colors.red,
          onPressed: onGooglePressed,
        ),
        const SizedBox(height: 12),
        SocialButton(
          text: "Continue with Facebook",
          icon: FontAwesomeIcons.facebookF,
          iconColor: const Color(0xFF1877F2),
          onPressed: onFacebookPressed,
        ),
      ],
    );
  }
}
