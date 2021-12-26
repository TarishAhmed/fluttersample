import 'package:common/dimens/app_dimens.dart';
import 'package:common/extensions/color_extensions.dart';
import 'package:common/widgets/colored_text.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';
import 'package:provider/src/provider.dart';
import 'package:sample_app/api_helper.dart';
import 'package:sample_app/data_model/comic_data_model.dart';
import 'package:sample_app/viewmodels/colors_view_model.dart';

import 'detail_screen.dart';

class ComicList extends StatefulWidget {


  final List<Color> colors;
  final Function(String) onColorTap;

  const ComicList({
    Key? key,
    required this.colors,
    required this.onColorTap,
  }) : super(key: key);

  @override
  State<ComicList> createState() => _ComicListState();
}

class _ComicListState extends State<ComicList> {
  List<ComicModel> comicList = [];
  int comicLimit = 20;

  @override
  Widget build(BuildContext context) {
    final ColorsViewModel colorsViewModel = Provider.of<ColorsViewModel>(context,listen: false);
    return FutureBuilder<List<ComicModel>>(

      future: colorsViewModel.getComics(),
      builder: (context, snapshot) {
        if(snapshot.hasData){
          return ListView.separated(
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => DetailScreen(comic: snapshot.data![index],)
                      )
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: ListTile(
                    leading: Hero(tag: 'comic_$index',
                    child: Image.network('${snapshot.data?[index].img}',height: 75,width: 75,)),
                    title: Text('${snapshot.data?[index].safeTitle}'),
                    subtitle: Text('${snapshot.data?[index].date}'),
                  ),
                ),
              );
            },
            shrinkWrap: true,
            separatorBuilder: (BuildContext context, int index) {
              return Divider();
          },

          );
        } else if(snapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator());

        }
        else{
          print(snapshot.error);
          print(snapshot.stackTrace);
          return Container();
        }

      }
    );
  }

  @override
  void initState() {

    super.initState();

  }
}
