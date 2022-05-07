import 'package:cats_app/landing_page.dart';
import 'package:cats_app/navigation/main_navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'screen/screens.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'domain/provider/google_sign_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static final mainNavigation = MainNavigation();
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //User? user = FirebaseAuth.instance.currentUser;
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const LandingPage(),
        routes: mainNavigation.routes,
      ),
    );
  }
}
