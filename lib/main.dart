// ignore_for_file: constant_identifier_names, avoid_print

import 'package:cats_app/bloc/auth_bloc/auth_bloc.dart';
import 'package:cats_app/domain/api/api_client.dart';
import 'package:cats_app/landing_page.dart';
import 'package:cats_app/navigation/main_navigation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'data/google_sign_in.dart';

const favoritesBox = "favorites";
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(favoritesBox);
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static final mainNavigation = MainNavigation();
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepository(),
      child: BlocProvider(
        create: (context) => AuthBloc(
            authRepository: RepositoryProvider.of<AuthRepository>(context)),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: RepositoryProvider(
            create: (context) => ApiClient(),
            child: const LandingPage(),
          ),
          routes: mainNavigation.routes,
        ),
      ),
    );
  }
}
