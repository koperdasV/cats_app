import 'package:cats_app/screen/Cats/cats_screen.dart';
import 'package:cats_app/screen/Favorite/favorite_screen.dart';
import 'package:cats_app/screen/Profile/profile_screen.dart';
import 'package:flutter/material.dart';
import '/components/custom_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedTab = 0;

  static const List<Widget> widgetOptions = [
    CatsScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];

  void onSelectTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      bottomNavigationBar: _buildBottomNavBar(),
      body: Center(child: widgetOptions[_selectedTab]),
    );
  }

  BottomNavigationBar _buildBottomNavBar() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Image(
              image: const AssetImage('images/cats.png'),
              color: _selectedTab == 0 ? Colors.blue : Colors.grey),
          label: 'Cats',
        ),
        BottomNavigationBarItem(
          icon: Image(
              image: const AssetImage('images/favorite.png'),
              color: _selectedTab == 1 ? Colors.blue : Colors.grey),
          label: 'Favorite',
        ),
        BottomNavigationBarItem(
          icon: Image(
              image: const AssetImage('images/profile.png'),
              color: _selectedTab == 2 ? Colors.blue : Colors.grey),
          label: 'Profile',
        ),
      ],
      currentIndex: _selectedTab,
      onTap: onSelectTab,
    );
  }
}
