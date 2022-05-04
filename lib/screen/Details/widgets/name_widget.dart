import 'package:flutter/material.dart';

class NameDetailsWidget extends StatelessWidget {
  const NameDetailsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Cats Fact',
      style: TextStyle(
          fontSize: 36,
          fontFamily: 'Angkor',
          color: Color.fromRGBO(69, 161, 227, 1)),
    );
  }
}