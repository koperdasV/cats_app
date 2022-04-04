import 'package:cats_app/domain/provider/provider.dart';
import 'package:cats_app/screen/Details/details_model.dart';
import 'package:cats_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final detailsListModel = DetailsModel();

  @override
  void initState() {
    super.initState();

    detailsListModel.loadFacts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Container(
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
                    children: [
                      const DividerDetailsWidget(),
                      NotifierProvider(
                        model: detailsListModel,
                        child: const FactDetailsWidget(),
                      ),
                    ],
                  )
                ],
              ),
            )
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<DetailsModel>(context);
    if (model == null) return const SizedBox.shrink();
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 31),
        child: Text(
          model.catFact.toString(),
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
