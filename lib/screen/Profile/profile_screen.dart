import 'package:cached_network_image/cached_network_image.dart';
import 'package:cats_app/screen/auth_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/auth_bloc/auth_bloc.dart';
import '/widgets/rounded_button_widget.dart';

class ProfileScreen extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;

  ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is UnAuthenticated) {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const AuthScreen()),
                ((route) => false));
          }
        },
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const SizedBox(height: 47),
                user.photoURL != null
                    ? CachedNetworkImage(
                        imageUrl: "${user.photoURL}",
                        placeholder: (context, url) => const CircleAvatar(
                          radius: 100,
                        ),
                        imageBuilder: (context, image) => CircleAvatar(
                          backgroundImage: image,
                          radius: 100,
                        ),
                      )
                    : Container(),
                const SizedBox(height: 32),
                user.displayName != null
                    ? Text(
                        "${user.displayName}",
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      )
                    : Container(),
                const SizedBox(height: 14),
                user.email != null
                    ? Text(
                        "${user.email}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFAEAEAE),
                        ),
                      )
                    : Container(),
                const SizedBox(height: 160),
                RoundedButtonWidget(
                  image: 'images/sign_out.png',
                  text: 'Sign out',
                  onPressed: () {
                    context.read<AuthBloc>().add(SignOutRequested());
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
