import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class GradientScaffold extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Gradient? gradient; // Optional parameter

  const GradientScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, 
      appBar: appBar,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          // Gunakan gradient yang dipass, kalau null pakai default (Blue)
          gradient: gradient ?? AppColors.blueGradient,
        ),
        child: SafeArea(
          child: body,
        ),
      ),
    );
  }
}
