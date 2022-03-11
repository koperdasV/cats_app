import 'package:cats_app/screen/Auth/auth.dart';
import 'package:cats_app/screen/Details/details_screen.dart';
import 'package:cats_app/screen/Favorite/favorite_screen.dart';
import 'package:cats_app/screen/Home/home_screen.dart';
import 'package:cats_app/screen/Profile/profile_screen.dart';
import 'package:cats_app/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const AuthScreen(),
      routes: {
        '/auth': (context) => const AuthScreen(),
        '/home': (context) => const HomeScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/favorite': (context) => const FavoriteScreen(),
        '/details': (context) => const DetailsScreen()
      },
      initialRoute: '/auth',
    );
  }
}
