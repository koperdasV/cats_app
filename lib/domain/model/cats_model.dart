import 'package:cats_app/domain/api/api_client.dart';
import 'package:cats_app/domain/entity/cats.dart';
import 'package:cats_app/navigation/main_navigation.dart';
import 'package:flutter/material.dart';

import '../entity/cat_fact.dart';

class CatsModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final _cats = <Cats>[];
  List<Cats> get cats => List.unmodifiable(_cats);

  final _catFact = <CatFact>[];
  List<CatFact> get catFact => List.unmodifiable(_catFact);
  
  Future loadCats() async {
    final catsResponse = await _apiClient.getCats(ApiClient().client);
    _cats.addAll(catsResponse);
  }

  Future<void> loadFacts() async {
    final factResponse = await _apiClient.getFacts(ApiClient().client);
    _catFact.addAll(factResponse);
  }

  Future<void> loadData() async {
    await loadCats();
    await loadFacts();
    notifyListeners();
  }

  void onCatsTap(BuildContext context, String fact, String image) {
    Navigator.of(context)
        .pushNamed(MainNavigationRouteName.details, arguments: {fact, image});
  }
}
