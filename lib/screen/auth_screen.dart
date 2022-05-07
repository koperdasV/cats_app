import 'package:cats_app/domain/provider/google_sign_in.dart';
import 'package:cats_app/screen/screens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '/widgets/rounded_button_widget.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isSigningIn = false;

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
                  onPressed: () async {
                    setState(() {
                      isSigningIn = true;
                    });
                    GoogleSignInProvider service = GoogleSignInProvider();
                    try {
                      await service.gooogleSignIn();
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const MainScreenWidget(),
                      ));
                    } catch (e) {
                      if (e is FirebaseAuthException) {
                        showMessage(e.message!);
                      }
                    }
                    setState(() {
                      isSigningIn = false;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showMessage(String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Error"),
            content: Text(message),
            actions: [
              TextButton(
                child: const Text("Ok"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}
