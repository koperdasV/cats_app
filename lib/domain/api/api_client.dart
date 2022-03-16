import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';

import '../entity/cats.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  final client = http.Client();
  static const host = 'https://api.thecatapi.com/v1/images/search?limit=10';
  static const apiKey = '13735389-3ecb-45d7-82f8-efc5cfc4ac61';

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
}
