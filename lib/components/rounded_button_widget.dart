import 'package:flutter/material.dart';

import '../../constants.dart';

class RoundedButtonWidget extends StatelessWidget {
  final Image img;
  final String text;
  const RoundedButtonWidget({
    Key? key,
    required this.img,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
        ),
        child: Ink(
          padding: const EdgeInsets.all(30),
          decoration: kPrimaryButton,
          child: Row(
            children: [
              img,
              const SizedBox(width: 40),
              Flexible(
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        onPressed: () {},
      ),
    );
  }
}