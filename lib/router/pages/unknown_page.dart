import 'package:flutter/material.dart';

import '../../unknown_screen.dart';


class UnknownPage extends Page {

  UnknownPage() : super(key: ValueKey('UnknownPage'));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
        settings: this,
        builder: (BuildContext context) {
          return UnknownScreen();
        });
  }
}
