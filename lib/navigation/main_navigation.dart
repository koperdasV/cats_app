import 'package:cats_app/screen/Profile/profile_screen.dart';
import 'package:cats_app/screen/auth_screen.dart';
import 'package:cats_app/screen/main_screen_widget.dart';
import 'package:flutter/material.dart';
import '../screen/Details/details_screen.dart';
import '../screen/Favorite/favorite_screen.dart';

abstract class MainNavigationRouteName {
  static const auth = '/auth';
  static const home = '/home';
  static const profile = '/profile';
  static const favorite = '/favorite';
  static const details = '/details';
}

class MainNavigation {
  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteName.auth: (context) => const AuthScreen(),
    MainNavigationRouteName.home: (context) => const MainScreenWidget(),
    MainNavigationRouteName.profile: (context) => ProfileScreen(),
    MainNavigationRouteName.favorite: (context) => const FavoriteScreen(),
    MainNavigationRouteName.details: (context) => const DetailsScreen(),
  };
}
