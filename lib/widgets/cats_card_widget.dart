import 'package:cached_network_image/cached_network_image.dart';
import 'package:cats_app/screen/Details/details_screen.dart';
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
      itemCount: model.catFact.length & model.cats.length,
      itemBuilder: (context, index) {
        model.showedCatsAtIndex(index);
        model.showedFactAtIndex(index);
        final cats = model.cats[index];
        final catFact = model.catFact[index];
        return InkWell(
          splashColor: Colors.red,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsScreen(
                fact: catFact.fact,
                image: cats.url,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
            child: SizedBox(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Hero(
                    tag: 'image-url-${cats.url}',
                    child: CachedNetworkImage(
                      imageUrl: cats.url,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.favorite_border),
                    onPressed: () {
                      addItem();
                    },
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

  void addItem() {}
}
