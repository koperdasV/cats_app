import 'dart:convert';
import 'dart:io';

import 'package:cats_app/domain/entity/cat_fact.dart';
import 'package:cats_app/domain/entity/cats.dart';
import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;

class ApiClient {
  final client = http.Client();
  static const host = 'https://api.thecatapi.com/v1/images/search?limit=10';
  static const hostFact = 'https://catfact.ninja/facts';
  static const apiKey = '13735389-3ecb-45d7-82f8-efc5cfc4ac61';
  static const apiKeyFact = 'axFUBfdnqAYHyE8v8lV16xoZ1KcFGBXV7flz4w2B';

  Future<List<Cats>> getPosts(http.Client client) async {
    final response = await client.get(
      Uri.parse(host),
      headers: {HttpHeaders.authorizationHeader: apiKey},
    );
    return compute(parsePhotos, response.body);
  }

  List<Cats> parsePhotos(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Cats>((json) => Cats.fromJson(json)).toList();
  }

  Future<List<CatFact>> getFacts(http.Client client) async {
    final response = await client.get(
      Uri.parse(hostFact),
      headers: {HttpHeaders.authorizationHeader: apiKeyFact},
    );
    return compute(parseFacts, response.body);
  }

  List<CatFact> parseFacts(String responseBody) {
    final parsed = jsonDecode(responseBody) as Map;

    final data = (parsed['data'] as List).cast<Map>();

    return data
        .map((json) => CatFact.fromJson(json.cast<String, dynamic>()))
        .toList();
  }
}
