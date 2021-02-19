import 'package:flutter/material.dart';
import 'package:flutter_light/utils/key_file.dart';
import 'package:flutter_light/utils/screen_size_handler.dart';
import 'package:flutter_light/widgets/custom_drawer_landscape.dart';
import 'package:flutter_light/widgets/custom_drawer_portrait.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Container(
      key: ValueKey(VALUE.DRAWER),
      child: (ScreenSizeHandler().myOrientation == ScreenOrientation.PORTRAIT)
          ? DrawerPortrait()
          : DrawerLandscape(),
    );
  }
}

