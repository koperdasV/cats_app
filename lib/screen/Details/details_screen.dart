import 'package:cats_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import 'widgets/divider_widget.dart';
import 'widgets/fact_widget.dart';
import 'widgets/image_widget.dart';
import 'widgets/name_widget.dart';

class DetailsScreen extends StatelessWidget {
  final String? fact;
  final String? image;

  const DetailsScreen({
    Key? key,
    this.fact,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: SizedBox(
          child: Column(
            children: [
              ImageWidget(image: image),
              const SizedBox(height: 27),
              const NameDetailsWidget(),
              const SizedBox(height: 40),
              Row(
                children: [
                  const DividerDetailsWidget(),
                  FactWidget(fact: fact!),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
