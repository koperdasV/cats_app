import 'package:flutter/material.dart';

import '../../constants.dart';

class RoundedButtonWidget extends StatelessWidget {
  final Image img;
  final String text;
  final VoidCallback onPressed;
  const RoundedButtonWidget({
    Key? key,
    required this.img,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),),
        ),
        child: Ink(
          padding: const EdgeInsets.all(25),
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
        onPressed: onPressed,
      ),
    );
  }
}
