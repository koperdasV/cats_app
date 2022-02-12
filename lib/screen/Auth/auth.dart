import 'package:flutter/material.dart';

import '/components/rounded_button_widget.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

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
                children: const [
                  Image(image: AssetImage('images/auth_logo.png')),
                  SizedBox(height: 48),
                  RoundedButtonWidget(
                    img: Image(image: AssetImage('images/facebook.png')),
                    text: 'Login with Facebook',
                  ),
                  SizedBox(height: 32),
                  RoundedButtonWidget(
                    img: Image(image: AssetImage('images/google.png')),
                    text: 'Login with Google',
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
