import 'package:cats_app/domain/api/api_client.dart';
import 'package:cats_app/domain/entity/cats.dart';
import 'package:cats_app/navigation/main_navigation.dart';
import 'package:flutter/material.dart';

class CatsModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final _cats = <Cats>[];
  List<Cats> get cats => List.unmodifiable(_cats);

  Future<void> loadCats() async {
    final catsResponse = await _apiClient.getPosts(ApiClient().client);
    _cats.addAll(catsResponse);
    notifyListeners();
  }

  void onCatsTap(BuildContext context, int index) {
    final id = _cats[index].id;
    Navigator.of(context)
        .pushNamed(MainNavigationRouteName.details, arguments: id);
  }

  void showedCatsAtIndex(int index) {
    if (index < _cats.length - 1) return;
    loadCats();
  }
}
