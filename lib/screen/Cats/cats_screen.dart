import 'package:flutter/material.dart';

import '/components/cats_card_widget.dart';

class CatsScreen extends StatefulWidget {
  const CatsScreen({Key? key}) : super(key: key);

  @override
  State<CatsScreen> createState() => _CatsScreenState();
}

class _CatsScreenState extends State<CatsScreen> {
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
              CatsCardWidget(),
              CatsCardWidget(),
            ],
          ),
        ],
      ),
    );
  }
}
