import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String? image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Hero(
          tag: 'image-url$image',
          child: CachedNetworkImage(
            imageUrl: image!,
          ),
        ),
        // IconButton(
        //   onPressed: () {},
        //   icon: const Icon(
        //     Icons.arrow_back_outlined,
        //     color: Color.fromRGBO(69, 161, 227, 1),
        //     size: 40,
        //   ),
        // ),
        Positioned(
          right: 10,
          bottom: 10,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_border,
              size: 32,
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}