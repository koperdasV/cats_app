import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../domain/provider/provider.dart';
import '../screen/Cats/cats_model.dart';

class CatsCardWidget extends StatelessWidget {
  const CatsCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<CatsModel>(context);
    if (model == null) return const SizedBox.shrink();
    return ListView.builder(
      itemCount: model.cats.length,
      itemBuilder: (context, index) {
        model.showedCatsAtIndex(index);
        final cat = model.cats[index];
        return InkWell(
          splashColor: Colors.red,
          onTap: () => model.onCatsTap(context, index),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
            child: SizedBox(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CachedNetworkImage(
                    imageUrl: cat.url,
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
