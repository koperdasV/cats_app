import 'package:flutter/material.dart';

class CatsCardWidget extends StatelessWidget {
  const CatsCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue,
        ),
        width: double.infinity,
        height: 180,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10, right: 10),
              child: IconButton(
                icon: const Icon(Icons.favorite_border),
                onPressed: () {},
                iconSize: 32,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
