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
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: const [
              CatsCardWidget(
                image:
                    AssetImage('images/cat.png'),
              ),
            ],
          );
        });
  }
}
