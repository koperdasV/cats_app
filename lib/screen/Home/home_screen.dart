import 'package:flutter/material.dart';

import 'components/cats_card_widget.dart';
import 'components/custom_app_bar.dart';
import 'components/nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(),
      appBar: CustomAppBar(),
      body: SizedBox(
        child: ListView(
          children: [
            Column(
              children: const [
                SizedBox(
                  height: 13,
                ),
                CatsCardWidget(),
                CatsCardWidget(),
                CatsCardWidget(),
                CatsCardWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
