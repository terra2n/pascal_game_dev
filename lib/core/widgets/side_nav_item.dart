import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class SideNavItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isActive;
  final VoidCallback onTap;

  const SideNavItem({
    super.key,
    required this.label,
    required this.icon,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: isActive ? AppColors.primary.withAlpha(25) : Colors.transparent, // More subtle active bg
              borderRadius: BorderRadius.circular(12),
              border: isActive ? Border.all(color: AppColors.primary.withAlpha(50)) : null,
            ),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: isActive ? AppColors.primary : Colors.grey[600],
                  size: 24,
                ),
                const SizedBox(width: 16),
                Text(
                  label,
                  style: TextStyle(
                    color: isActive ? AppColors.primary : Colors.grey[700],
                    fontSize: 16,
                    fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
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
