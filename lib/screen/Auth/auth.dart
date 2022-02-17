import 'package:flutter/material.dart';

import '/components/rounded_button_widget.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  void _auth() {
    setState(() {
      Navigator.of(context).pushNamed('/home');
    });
  }

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
                    img: const Image(image: AssetImage('images/facebook.png')),
                    text: 'Login with Facebook',
                    onPressed: _auth,
                  ),
                  const SizedBox(height: 32),
                  RoundedButtonWidget(
                    img: const Image(image: AssetImage('images/google.png')),
                    text: 'Login with Google',
                    onPressed: (){},
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
