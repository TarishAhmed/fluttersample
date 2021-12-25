
import 'package:flutter/material.dart';
import 'package:sample_app/data/colors_repository.dart';
import 'package:sample_app/data_model/comic_data_model.dart';

class ColorsViewModel extends ChangeNotifier {
  final ColorsRepository? colorsRepository;
  bool fetchingColors = false;
  bool clearingColors = false;

  ColorsViewModel(this.colorsRepository);

  fetchColors() async {
    fetchingColors = true;
    notifyListeners();
    await colorsRepository!.fetchColors();
    fetchingColors = false;
    notifyListeners();
  }

   Future<List<ComicModel>> getComics() async {
    List<ComicModel> comicList = [];
    fetchingColors = true;
    // notifyListeners();
    comicList = await colorsRepository!.getComics();
    fetchingColors = false;
    // notifyListeners();
    return comicList;
  }

  clearColors() async {
    clearingColors = true;
    notifyListeners();
    await colorsRepository!.clearColors();
    clearingColors = false;
    notifyListeners();
  }
}
