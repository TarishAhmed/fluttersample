import 'dart:convert';


import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sample_app/data_model/comic_data_model.dart';

class ApiHelper{
  static Future<ComicModel> getComic({required int index}) async {
    final url =
    Uri.parse('https://xkcd.com/$index/info.0.json');
    final response = await http.get(url, headers: <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });
    if (response.statusCode == 200) {
      if (response.body.isEmpty) print('found it 2');
      final Map<String, dynamic> comic = json.decode(response.body);
      try {
        return ComicModel.fromJson(comic);
      } catch (ex) {
        throw Exception(ex);
      }
    } else {
      throw Exception(response.body);
    }
  }
}