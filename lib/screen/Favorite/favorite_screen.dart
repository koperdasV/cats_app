import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../domain/model/cats_model.dart';
import '../../domain/provider/provider.dart';
import '../Details/details_screen.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<CatsModel>(context);
    //if (model == null) return const SizedBox.shrink();

    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("users-fav-items")
            .doc(FirebaseAuth.instance.currentUser!.email)
            .collection("items")
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text("Something is wrong"),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data == null ? 0: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
            final catFact = model?.catFact[index];
            DocumentSnapshot documentSnapshot = snapshot.data!.docs[index];
            return InkWell(
                  splashColor: Colors.red,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(
                        fact: catFact?.fact,
                        image: documentSnapshot['imgUrl'],
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 13, horizontal: 20),
                    child: SizedBox(
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CachedNetworkImage(
                            imageUrl: documentSnapshot['imgUrl'],
                          ),
                          IconButton(
                            icon: snapshot.data!.docs.isEmpty
                                ? const Icon(
                                    Icons.favorite_outline,
                                    color: Colors.red,
                                  )
                                : const Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  ),
                            onPressed: (){
                              FirebaseFirestore.instance
                        .collection("users-fav-items")
                        .doc(FirebaseAuth.instance.currentUser!.email)
                        .collection("items")
                        .doc(documentSnapshot.id)
                        .delete();
                            },
                            iconSize: 32,
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
          });
        });
  }
}
