import 'package:flutter/material.dart';

class DividerDetailsWidget extends StatelessWidget {
  const DividerDetailsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 22, left: 38),
      child: Container(
        width: 4,
        height: 180,
        color: const Color.fromRGBO(69, 161, 227, 1),
      ),
    );
  }
}