// ignore_for_file: avoid_print
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cats_app/screen/Details/details_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../domain/provider/provider.dart';
import '../domain/model/cats_model.dart';

class CatsCardWidget extends StatefulWidget {
  const CatsCardWidget({Key? key}) : super(key: key);

  @override
  State<CatsCardWidget> createState() => _CatsCardWidgetState();
}

class _CatsCardWidgetState extends State<CatsCardWidget> {
  FirebaseAuth auth = FirebaseAuth.instance;
  final user = FirebaseAuth.instance.currentUser;

  sendUserDataToDB() async {
    CollectionReference collectionRef =
        FirebaseFirestore.instance.collection("users-data");
    return collectionRef
        .doc(user?.email)
        .set({
          "uid": user?.uid,
          "name": user?.displayName,
          "email": user?.email,
        })
        .then((value) => print('user data added'))
        .catchError((error) => print('error add user'));
  }

  @override
  void initState() {
    super.initState();
    sendUserDataToDB();
  }

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<CatsModel>(context);
    if (model == null) return const SizedBox.shrink();
    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(const Duration(seconds: 2));
        model.loadData();
      },
      child: ListView.builder(
        itemCount: model.cats.length,
        itemBuilder: (context, index) {
          final cats = model.cats[index];
          final catFact = model.catFact[index];
          Future addToFavorite() async {
            CollectionReference collectionRef =
                FirebaseFirestore.instance.collection("users-fav-items");
            return collectionRef
                .doc(user?.email)
                .collection("items")
                .doc()
                .set({
              "imgUrl": cats.url,
              "imgId": cats.id,
            }).then((value) => print("add to favorite"));
          }

          return StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("users-fav-items")
                  .doc(FirebaseAuth.instance.currentUser!.email)
                  .collection("items")
                  .where("imgUrl", isEqualTo: cats.url)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return const Text("");
                }
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 13, horizontal: 20),
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
                            icon: snapshot.data!.docs.isEmpty
                                ? const Icon(
                                    Icons.favorite_outline,
                                    color: Colors.red,
                                  )
                                : const Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  ),
                            onPressed: () => snapshot.data!.docs.isEmpty
                                ? addToFavorite()
                                : print("Already Added"),
                            iconSize: 32,
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}

// class CatsCard extends StatelessWidget {
//   const CatsCard({
//     Key? key,
//     required this.catFact,
//     required this.cats,
//   }) : super(key: key);

//   final CatFact catFact;
//   final Cats cats;

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => CatsListBloc(
//         RepositoryProvider.of(context),
//       )..add(LoadCatsEvent()),
//       child: InkWell(
//         splashColor: Colors.red,
//         onTap: () => Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => DetailsScreen(
//               fact: catFact.fact,
//               image: cats.url,
//             ),
//           ),
//         ),
//         child: BlocBuilder<CatsListBloc, CatsListState>(
//           builder: (context, state) {
//             if (state is CatsLoadingState) {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//             if (state is CatsLoadedState) {
//               return Padding(
//                 padding:
//                     const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
//                 child: SizedBox(
//                   child: Stack(
//                     alignment: Alignment.bottomRight,
//                     children: [
//                       Hero(
//                         tag: 'image-url-${cats.url}',
//                         child: CachedNetworkImage(
//                           imageUrl: ,
//                         ),
//                       ),
//                       IconButton(
//                         icon: Hive.box(favoritesBox).containsKey([])
//                             ? const Icon(Icons.favorite)
//                             : const Icon(Icons.favorite_border),
//                         onPressed: () {
//                           //Hive.box(favoritesBox).put(key, fal);
//                           // auth
//                           //     .authStateChanges()
//                           //     .firstWhere((user) => user != null)
//                           //     .then((value) {
//                           //   DatabaseReference ref = FirebaseDatabase.instance
//                           //       .ref("users")
//                           //       .child(cats.id)
//                           //       .child("favorite")
//                           //       .child(value!.uid)
//                           //       .child("state");
//                           //   ref.set("true").then((value) => print('add doc'));
//                           // });
//                         },
//                         iconSize: 32,
//                         color: Colors.red,
//                       )
//                     ],
//                   ),
//                 ),
//               );
//             }
//             if (state is CatsErrorState) {
//               return Center(
//                 child: Text(state.error.toString()),
//               );
//             }
//             return Container();
//           },
//         ),
//       ),
//     );
//   }
// }
