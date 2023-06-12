import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sizer/sizer.dart';

class AppBottomNavigationBar extends ConsumerStatefulWidget {
  const AppBottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState
    extends ConsumerState<AppBottomNavigationBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GNav(
      rippleColor: Colors.grey[300]!,
      hoverColor: Colors.grey[100]!,
      gap: 8,
      activeColor: Colors.black,
      iconSize: 24,
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
      duration: const Duration(milliseconds: 400),
      tabBackgroundColor: Theme.of(context).secondaryHeaderColor,
      color: Colors.black,
      tabs: const [
        GButton(
          icon: Icons.house,
          text: 'Accueil',
        ),
        GButton(
          icon: Icons.heart_broken,
          text: 'Likes',
        ),
        GButton(
          icon: Icons.loupe,
          text: 'Search',
        ),
        GButton(
          icon: Icons.person,
          text: 'Profile',
        ),
      ],
      selectedIndex: _selectedIndex,
      onTabChange: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
    );
  }
}
