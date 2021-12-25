import 'package:common/dimens/app_dimens.dart';
import 'package:common/extensions/color_extensions.dart';
import 'package:common/widgets/colored_text.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';
import 'package:sample_app/api_helper.dart';
import 'package:sample_app/data/colors_repository.dart';
import 'package:sample_app/data_model/comic_data_model.dart';

class DetailScreen extends StatefulWidget {

  final ComicModel comic;

  const DetailScreen({
    Key? key, required this.comic,

  }) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Comic Detail'),

      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.network('${widget.comic.img}',width: double.infinity, height: 150, fit: BoxFit.cover,),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('${widget.comic.safeTitle}',textAlign: TextAlign.start, style: Theme.of(context).textTheme.headline4,),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('${widget.comic.date}',textAlign: TextAlign.start, style: Theme.of(context).textTheme.headline6,),
                    ),
                  ],
                ),
                Wrap(
                  alignment: WrapAlignment.start,
                  children: [
                    Text('${widget.comic.transcript}')
                  ],
                )
              ],
            ),
          ),
        ),
      ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FloatingActionButton(
                onPressed: () {
                  ColorsRepository colorsRepository = ColorsRepository();
                  var prevComic = colorsRepository.comicList.firstWhere((comic) =>  comic.num == widget.comic.num-1);
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => DetailScreen(comic: prevComic,)
                      )
                  );

                },
                child: Icon(Icons.navigate_before),
              ),
              FloatingActionButton(
                onPressed: () {
                  ColorsRepository colorsRepository = ColorsRepository();
                  var nextComic = colorsRepository.comicList.firstWhere((comic) =>  comic.num == widget.comic.num+1);
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => DetailScreen(comic: nextComic,)
                      )
                  );
                },
                child: Icon(Icons.navigate_next),
              )
            ],
          ),
        )
    );
  }

}
