import 'package:cats_app/navigation/main_navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../domain/provider/google_sign_in.dart';
import '/widgets/rounded_button_widget.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(image: AssetImage('images/auth_logo.png')),
                const SizedBox(height: 48),
                RoundedButtonWidget(
                  image: 'images/facebook.png',
                  text: 'Login with Facebook',
                  onPressed: () {},
                ),
                const SizedBox(height: 32),
                RoundedButtonWidget(
                  image: 'images/google.png',
                  text: 'Login with Google',
                  onPressed: () {
                    final provider = Provider.of<GoogleSignInProvider>(context,
                        listen: false);
                    provider.gooogleSignIn();
                    Navigator.of(context)
                        .pushNamed(MainNavigationRouteName.home);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
