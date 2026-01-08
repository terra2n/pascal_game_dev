import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import '../constants/route_paths.dart';
import '../theme/app_colors.dart';
import 'side_nav_item.dart';

class SideNavbar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onIndexChanged;
  final String userName;
  final String userLocation;

  const SideNavbar({
    super.key,
    required this.selectedIndex,
    required this.onIndexChanged,
    this.userName = "Pascal Dev", // Default placeholder
    this.userLocation = "Indonesia",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. HEADER (User Profile)
          _buildHeader(context),
          
          const SizedBox(height: 48), 

          // 2. MENU ITEMS
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                SideNavItem(
                  label: "Home",
                  icon: Icons.home_rounded,
                  isActive: selectedIndex == 0,
                  onTap: () => onIndexChanged(0),
                ),
                SideNavItem(
                  label: "Discussion",
                  icon: Icons.chat_bubble_outline_rounded,
                  isActive: selectedIndex == 1,
                  onTap: () => onIndexChanged(1),
                ),
                SideNavItem(
                  label: "Jobs",
                  icon: Icons.work_outline_rounded,
                  isActive: selectedIndex == 2,
                  onTap: () => onIndexChanged(2),
                ),
                 SideNavItem(
                  label: "Profile",
                  icon: Icons.person_outline_rounded,
                  isActive: selectedIndex == 3,
                  onTap: () => onIndexChanged(3),
                ),
                SideNavItem(
                  label: "Settings",
                  icon: Icons.settings_outlined,
                  isActive: selectedIndex == 4,
                  onTap: () => onIndexChanged(4),
                ),
              ],
            ),
          ),

          // 3. FOOTER (Sign Out)
          SideNavItem(
            label: "Sign Out",
            icon: Icons.logout_rounded,
            isActive: false,
            onTap: () {
               // Logout Logic
               // context.read<AuthBloc>().add(LogoutRequested()); // If event existed
               // For now just navigate to Login
               context.go(RoutePaths.login);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        // Avatar
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            shape: BoxShape.circle,
            image: const DecorationImage(
              // Using a placeholder asset or network image
              // Since we don't have a reliable user image yet, use an icon or asset if available
              image: AssetImage('assets/images/logo_icon.png'), // Fallback to logo for now as placeholder
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 12),
        
        // Name & Location
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userName,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                userLocation,
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.textSecondary,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        
        // Notification Icon
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_outlined, size: 20, color: Colors.grey),
            constraints: const BoxConstraints(minWidth: 40, minHeight: 40),
            padding: EdgeInsets.zero,
          ),
        )
      ],
    );
  }
}
