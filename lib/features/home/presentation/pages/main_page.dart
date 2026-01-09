import 'package:flutter/material.dart';
import '../../../../core/widgets/app_bottom_nav.dart';
import '../../../../core/widgets/side_navbar.dart';
import 'home_page.dart';
import '../../../../features/inspirasi/presentation/pages/inspirasi_page.dart';
import '../../../../features/create_content/presentation/pages/create_content_page.dart';
import '../../../../features/tutorial/presentation/pages/tutorial_page.dart';
import '../../../../features/forum/presentation/pages/forum_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _bottomNavIndex = 0;
  int _sideNavIndex = 0;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Widget> _pages = [
    const HomePage(),
    const InspirasiPage(),
    const CreateContentPage(),
    const TutorialPage(),
    const ForumPage(),
  ];

  void _onBottomNavTapped(int index) {
    setState(() {
      _bottomNavIndex = index;
    });
  }

  void _onSideNavTapped(int index) {
    setState(() {
      _sideNavIndex = index;
      // Sync with Bottom Nav where applicable
      if (index == 0) {
        _bottomNavIndex = 0; // Home
      } else if (index == 3) {
        _bottomNavIndex = 4; // Profile is now index 4
      }
      // For other indices (Discussion, Jobs, Settings), we would typically
      // Navigate to a different route or show a different widget.
      // For this demo, we'll keep the current view or just close drawer.
    });
    // Close drawer after selection on mobile
    _scaffoldKey.currentState?.closeDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: SideNavbar(
        selectedIndex: _sideNavIndex,
        onIndexChanged: _onSideNavTapped,
      ),
      body: IndexedStack(
        index: _bottomNavIndex,
        children: _pages,
      ),
      bottomNavigationBar: AppBottomNav(
        selectedIndex: _bottomNavIndex,
        onTap: _onBottomNavTapped,
      ),
    );
  }
}
