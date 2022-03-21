import 'package:cats_app/domain/entity/cats.dart';
import 'package:cats_app/pages/details_screen.dart';
import 'package:flutter/material.dart';

class CatsCardWidget extends StatelessWidget {
  const CatsCardWidget({
    Key? key,
    required this.photos,
  }) : super(key: key);
  final List<Cats> photos;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: photos.length,
      itemBuilder: (context, index) {
        return InkWell(
          splashColor: Colors.red,
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => const DetailsScreen())));
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
            child: SizedBox(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Center(
                    child: Image.network(photos[index].url),
                  ),
                  IconButton(
                    icon: const Icon(Icons.favorite_border),
                    onPressed: () {},
                    iconSize: 32,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}