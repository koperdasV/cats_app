import 'package:cats_app/domain/provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'Cats/cats_model.dart';
import 'screens.dart';
import 'package:cats_app/widgets/bottom_nav_bar_widget.dart';
import 'package:flutter/material.dart';
import '/widgets/custom_app_bar.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({Key? key}) : super(key: key);

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  final ValueNotifier<int> pageIndex = ValueNotifier(0);
  final catsListModel = CatsModel();

  void _onNavigationItemSelected(index) {
    pageIndex.value = index;
  }

  @override
  void initState() {
    super.initState();
    catsListModel.loadCats();
    catsListModel.loadFacts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      bottomNavigationBar:
          BottomNavBar(onItemSelected: _onNavigationItemSelected),
      body: FutureBuilder(
        initialData: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return ValueListenableBuilder(
                valueListenable: pageIndex,
                builder: (context, int value, _) {
                  return IndexedStack(
                    index: pageIndex.value,
                    children: [
                      NotifierProvider(
                          model: catsListModel, child: const CatsScreen()),
                      const FavoriteScreen(),
                      const ProfileScreen(),
                    ],
                  );
                });
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Error'),
            );
          } else {
            return const AuthScreen();
          }
        },
      ),
    );
  }
}
