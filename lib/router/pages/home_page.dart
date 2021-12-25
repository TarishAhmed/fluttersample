

import 'package:flutter/material.dart';

import '../../home_screen.dart';


class HomePage extends Page {
  final Function(String) onColorTap;
  final VoidCallback onLogout;
  final List<Color> colors;

  HomePage({
    required this.onColorTap,
    required this.onLogout,
    required this.colors,
  }) : super(key: ValueKey('HomePage'));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return HomeScreen(
          onColorTap: onColorTap,
          onLogout: onLogout,
          colors: colors,
        );
      },
    );
  }
}
