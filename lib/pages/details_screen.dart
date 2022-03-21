import 'package:cats_app/domain/entity/cats.dart';
import 'package:cats_app/widgets/custom_app_bar.dart';
import 'package:cats_app/domain/entity/cat_fact.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final Cats photos;
    return Scaffold(
      appBar: CustomAppBar(),
      body: FutureBuilder<List<CatFact>>(
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Сталася помилка!'),
            );
          } else if (snapshot.hasData) {
            return Container(
              color: Colors.white,
              child: Column(
                children: [
                  Stack(
                    children: [
                      // Image.network(src),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_back_outlined,
                            color: Color.fromRGBO(69, 161, 227, 1),
                            size: 40,
                          )),
                      Positioned(
                        right: 10,
                        bottom: 10,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Image(
                            image: AssetImage('images/like.png'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 27),
                  const NameDetailsWidget(),
                  const SizedBox(height: 40),
                  Row(
                    children:  const [
                      DividerDetailsWidget(),
                      // FactDetailsWidget(
                      //   textFact: ,
                      // ),
                    ],
                  )
                ],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class NameDetailsWidget extends StatelessWidget {
  const NameDetailsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Cats Fact',
      style: TextStyle(
          fontSize: 36,
          fontFamily: 'Angkor',
          color: Color.fromRGBO(69, 161, 227, 1)),
    );
  }
}

class DividerDetailsWidget extends StatelessWidget {
  const DividerDetailsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 22, left: 38),
      child: Container(
        width: 4,
        height: 180,
        color: const Color.fromRGBO(69, 161, 227, 1),
      ),
    );
  }
}

class FactDetailsWidget extends StatelessWidget {
  const FactDetailsWidget({
    Key? key,
    required this.textFact,
  }) : super(key: key);

  final CatFact textFact;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 31),
        child: Text(
          textFact.fact,
          overflow: TextOverflow.ellipsis,
          maxLines: 4,
          style: const TextStyle(
              fontSize: 24,
              fontFamily: 'Angkor',
              color: Color.fromRGBO(69, 161, 227, 1)),
        ),
      ),
    );
  }
}
