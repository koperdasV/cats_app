import 'package:cats_app/constants.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kPrimaryColor,
      child: const Center(
        child: Image(image: AssetImage('images/splash_logo.png')),
      ),
    );
  }
}
