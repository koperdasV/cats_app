import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../domain/provider/google_sign_in.dart';
import '../../navigation/main_navigation.dart';
import '/widgets/rounded_button_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const SizedBox(height: 47),
              CachedNetworkImage(
                imageUrl: user.photoURL ?? '',
                placeholder: (context, url) => const CircleAvatar(
                  radius: 100,
                ),
                imageBuilder: (context, image) => CircleAvatar(
                  backgroundImage: image,
                  radius: 100,
                ),
              ),
              const SizedBox(height: 32),
              Text(
                user.displayName ?? '',
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 14),
              Text(
                user.email ?? '',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFFAEAEAE),
                ),
              ),
              const SizedBox(height: 160),
              RoundedButtonWidget(
                image: 'images/sign_out.png',
                text: 'Sign out',
                onPressed: () {
                  final provider =
                      Provider.of<GoogleSignInProvider>(context, listen: false);
                  provider.logOut();
                  Navigator.of(context).pushNamed(MainNavigationRouteName.auth);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
