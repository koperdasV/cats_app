import 'package:cats_app/widgets/cats_card_widget.dart';
import 'package:cats_app/domain/entity/cats.dart';
import 'package:flutter/material.dart';

import '../domain/api/api_client.dart';

class CatsScreen extends StatefulWidget {
  const CatsScreen({Key? key}) : super(key: key);

  @override
  State<CatsScreen> createState() => _CatsScreenState();
}

class _CatsScreenState extends State<CatsScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Cats>>(
      future: ApiClient().getPosts(ApiClient().client),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text('Сталася помилка!'),
          );
        } else if (snapshot.hasData) {
          return CatsCardWidget(photos: snapshot.data!);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
