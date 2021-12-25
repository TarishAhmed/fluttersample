
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample_app/data_model/comic_data_model.dart';

import '../api_helper.dart';

class ColorsRepository {
  int comicIndex = 1;
  int limit = 20;
  List<ComicModel> comicList = [];
  /// Makes a fake call to cache that returns data after 3 seconds
  Future<List<Color>> fetchColors() async {
    return Future.delayed(Duration(seconds: 3)).then(
      (value) {
        return Colors.primaries.reversed.toList();
      },
    );
  }

  /// Makes a fake call to cache that returns data after 3 seconds
  Future<bool> clearColors() async {
    return Future.delayed(Duration(seconds: 3)).then((value) => true);
  }
  Future<List<ComicModel>> getComics() async{
    while(comicIndex<=limit){
      ComicModel comic = await ApiHelper.getComic(index: comicIndex);

      print(comic.title);

      comicList.add(comic);
      comicIndex++;
    }
    return comicList;
  }
}
