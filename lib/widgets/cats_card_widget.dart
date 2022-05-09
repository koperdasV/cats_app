// ignore_for_file: avoid_print
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cats_app/domain/entity/cats.dart';
import 'package:cats_app/domain/entity/cat_fact.dart';
import 'package:cats_app/screen/Details/details_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../domain/provider/provider.dart';
import '../screen/Cats/cats_model.dart';

class CatsCardWidget extends StatefulWidget {
  const CatsCardWidget({Key? key}) : super(key: key);

  @override
  State<CatsCardWidget> createState() => _CatsCardWidgetState();
}

class _CatsCardWidgetState extends State<CatsCardWidget> {
  FirebaseAuth auth = FirebaseAuth.instance;

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
        return CatsCard(catFact: catFact, cats: cats, auth: auth);
      },
    );
  }
}

class CatsCard extends StatelessWidget {
  const CatsCard({
    Key? key,
    required this.catFact,
    required this.cats,
    required this.auth,
  }) : super(key: key);

  final CatFact catFact;
  final Cats cats;
  final FirebaseAuth auth;

  @override
  Widget build(BuildContext context) {
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
                  auth
                      .authStateChanges()
                      .firstWhere((user) => user != null)
                      .then((value) {
                    DatabaseReference ref = FirebaseDatabase.instance
                        .ref("users")
                        .child(cats.id)
                        .child("favorite")
                        .child(value!.uid)
                        .child("state");
                    ref.set("true").then((value) => print('add doc'));
                  });
                },
                iconSize: 32,
                color: Colors.red,
              )
            ],
          ),
        ),
      ),
    );
  }
}
