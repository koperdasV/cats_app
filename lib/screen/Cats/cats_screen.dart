import 'package:cats_app/domain/entity/cats.dart';
import 'package:flutter/material.dart';

import '../../domain/api/api_client.dart';
import '../Details/details_screen.dart';

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

class CatsCardWidget extends StatelessWidget {
  const CatsCardWidget({
    Key? key,
    required this.photos,
  }) : super(key: key);
    final List<Cats> photos;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      return InkWell(
        splashColor: Colors.red,
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => const DetailsScreen())));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blue[300],
              boxShadow: [
                BoxShadow(
                  blurRadius: 8,
                  color: Colors.grey.withOpacity(0.8),
                  offset: const Offset(0, 2),
                ),
              ],
            ),
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
    });
  }
}
