import 'package:cats_app/domain/api/api_client.dart';
import 'package:cats_app/domain/entity/cat_fact.dart';
import 'package:flutter/cupertino.dart';

class DetailsModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final _catFact = <CatFact>[];
  List<CatFact> get catFact => List.unmodifiable(_catFact);

  Future<void> loadFacts() async {
    final factResponse = await _apiClient.getFacts(ApiClient().client);
    _catFact.addAll(factResponse);
    notifyListeners();
  }
}
