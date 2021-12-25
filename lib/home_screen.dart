

import 'package:flutter/material.dart';

import "package:provider/provider.dart";
import 'package:sample_app/viewmodels/auth_view_model.dart';
import 'package:sample_app/viewmodels/colors_view_model.dart';
import 'package:sample_app/widgets/color_gridview.dart';
import 'package:sample_app/widgets/in_progress_message.dart';
import 'package:sample_app/widgets/logout_fab_04.dart';

class HomeScreen extends StatelessWidget {
  final Function(String) onColorTap;
  final List<Color> colors;
  final VoidCallback onLogout;

  const HomeScreen({
    Key? key,
    required this.onColorTap,
    required this.onLogout,
    required this.colors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: _body(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: LogoutFab(onLogout: onLogout),
    );
  }

  Widget _body(BuildContext context) {
    final authViewModel = context.watch<AuthViewModel>();
    final colorsViewModel = context.watch<ColorsViewModel>();
    bool inProgress;
    String? progressName;
    if (authViewModel.logingOut) {
      inProgress = true;
      progressName = "Logout";
    } else if (colorsViewModel.clearingColors) {
      inProgress = true;
      progressName = "Clearing colors";
    } else {
      inProgress = false;
      progressName = null;
    }
    return inProgress && progressName != null
        ? InProgressMessage(progressName: progressName, screenName: "HomeScreen")
        : ColorGrid(colors: colors, onColorTap: onColorTap);
  }
}
