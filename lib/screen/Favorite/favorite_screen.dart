import 'package:flutter/material.dart';
import '/components/cats_card_widget.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView(
        children: [
          Column(
            children: const [
              SizedBox(height: 13),
              CatsCardWidget(),
              CatsCardWidget(),
            ],
          ),
        ],
      ),
    );
  }
}
