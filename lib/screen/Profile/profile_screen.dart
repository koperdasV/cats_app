import 'package:flutter/material.dart';
import '/components/rounded_button_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: const [
              SizedBox(height: 47),
              Placeholder(
                fallbackHeight: 200,
              ),
              SizedBox(height: 32),
              Text(
                'Мурчик Барсенко',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 14),
              Text(
                'barsenkom@gmail.com',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFFAEAEAE),
                ),
              ),
              SizedBox(height: 48),
              RoundedButtonWidget(
                  img: Image(image: AssetImage('images/sign_out.png')),
                  text: 'Sign out')
            ],
          ),
        ),
      ),
    );
  }
}
