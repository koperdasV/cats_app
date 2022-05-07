import 'package:cats_app/screen/auth_screen.dart';
import 'package:cats_app/screen/main_screen_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    final bool isLoggedIn = user != null;
    
    return isLoggedIn ? const MainScreenWidget() : const AuthScreen();
  }
}
