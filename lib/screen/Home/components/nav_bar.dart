import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  void _selectedTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, size: 32),
          label: 'Cats',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border, size: 32),
          label: 'Favorite',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person, size: 32),
          label: 'Profile',
        ),
      ],
      currentIndex: _selectedIndex,
      onTap: _selectedTab,
    );
  }
}
