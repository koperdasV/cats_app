import 'package:flutter/material.dart';

class FactWidget extends StatelessWidget {
  const FactWidget({
    Key? key,
    required this.fact,
  }) : super(key: key);

  final String fact;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 31),
        child: Text(
          fact,
          overflow: TextOverflow.ellipsis,
          maxLines: 4,
          style: const TextStyle(
              fontSize: 24,
              fontFamily: 'Angkor',
              color: Color.fromRGBO(69, 161, 227, 1)),
        ),
      ),
    );
  }
}