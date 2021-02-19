import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_light/ui/home/a_home_page.dart';
import 'package:flutter_light/utils/screen_size_handler.dart';
import 'package:flutter_light/widgets/inovex_dialog.dart';

abstract class PageInitializer {
  void initScreenSize(BuildContext context){
    ScreenSizeHandler().initScreen(
        MediaQuery.of(context).size.height,
        MediaQuery.of(context).size.width
    );
  }
}

abstract class PageHelper {
  void autoNavigate(BuildContext context){
    Timer(const Duration(seconds: 3), () {
      Navigator.pushNamed(context, HomePage.route);
    });
  }

  void navigateTo(BuildContext context, String route){
    Navigator.pushNamed(context, route);
  }

  show(BuildContext context){
    showDialog(
        context: context,
        builder: (_) {
          return InovexDialog(
            title: "Inovex Dialog",
            content: "Test Test Test",
            leftLabel: "cancel",
            rightLabel: "ok",
            rightButtonCallback: () {
              Navigator.pushNamed(context, HomePage.route);
            },
            leftButtonCallback: () {
              Navigator.of(context).pop();
            },
          );
        });
  }
}