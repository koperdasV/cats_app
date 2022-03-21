import 'package:cats_app/screen/auth_screen.dart';
import 'package:cats_app/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'pages/details_screen.dart';
import 'pages/favorite_screen.dart';
import 'pages/profile_screen.dart';

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
        '/home': (context) => HomeScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/favorite': (context) => const FavoriteScreen(),
        '/details': (context) => const DetailsScreen()
      },
      initialRoute: '/auth',
    );
  }
}
