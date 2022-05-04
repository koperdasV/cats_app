import 'package:cats_app/domain/api/api_client.dart';
import 'package:cats_app/domain/entity/cats.dart';
import 'package:cats_app/navigation/main_navigation.dart';
import 'package:flutter/material.dart';

import '../../domain/entity/cat_fact.dart';

class CatsModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final _cats = <Cats>[];
  List<Cats> get cats => List.unmodifiable(_cats);
  
  final _catFact = <CatFact>[];
  List<CatFact> get catFact => List.unmodifiable(_catFact);

  Future<void> loadFacts() async {
    final factResponse = await _apiClient.getFacts(ApiClient().client);
    _catFact.addAll(factResponse);
    notifyListeners();
  }
  
  void showedFactAtIndex(int index) {
    if (index < _catFact.length - 1) return;
    loadFacts();
  }

  Future<void> loadCats() async {
    final catsResponse = await _apiClient.getPosts(ApiClient().client);
    _cats.addAll(catsResponse);
    notifyListeners();
  }

  void onCatsTap(BuildContext context, String fact, String image) {
    //final id = _cats[index].id;
    Navigator.of(context)
        .pushNamed(MainNavigationRouteName.details, arguments: {fact, image});
  }

  void showedCatsAtIndex(int index) {
    if (index < _cats.length - 1) return;
    loadCats();
  }
}
  
