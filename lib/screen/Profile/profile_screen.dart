import 'package:flutter/material.dart';
import '/components/rounded_button_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void _signOut() {
    Navigator.of(context).pushNamed('/auth');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const SizedBox(height: 47),
              Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'Мурчик Барсенко',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 14),
              const Text(
                'barsenkom@gmail.com',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFFAEAEAE),
                ),
              ),
              const SizedBox(height: 160),
              RoundedButtonWidget(
                img: const Image(image: AssetImage('images/sign_out.png')),
                text: 'Sign out',
                onPressed: _signOut,
              )
            ],
          ),
        ),
      ),
    );
  }
}
