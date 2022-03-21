import 'package:cats_app/pages/cats_screen.dart';
import 'package:cats_app/pages/favorite_screen.dart';
import 'package:cats_app/pages/profile_screen.dart';
import 'package:cats_app/widgets/bottom_nav_bar_widget.dart';
import 'package:flutter/material.dart';
import '/widgets/custom_app_bar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final ValueNotifier<int> pageIndex = ValueNotifier(0);

  final pages = const [
    CatsScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      bottomNavigationBar: BottomNavBar(
        onItemSelected: (index) {
          pageIndex.value = index;
        },
      ),
      body: ValueListenableBuilder(
        valueListenable: pageIndex,
        builder: (context, int value, _) {
          return pages[value];
        },
      ),
    );
  }
}
