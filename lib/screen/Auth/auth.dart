import 'package:cats_app/constants.dart';
import 'package:flutter/material.dart';

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

class RoundedButtonWidget extends StatelessWidget {
  final Image img;
  final String text;
  const RoundedButtonWidget({
    Key? key,
    required this.img,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
        ),
        child: Ink(
          padding: const EdgeInsets.all(30),
          decoration: kPrimaryButton,
          child: Row(
            children: [
              img,
              const SizedBox(width: 40),
              Flexible(
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        onPressed: () {},
      ),
    );
  }
}
