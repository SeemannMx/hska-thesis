import 'package:flutter/material.dart';
import 'package:flutter_light/utils/custom_colors.dart';
import 'package:flutter_light/utils/key_file.dart';
import 'package:flutter_light/utils/screen_size_handler.dart';

class CustomDrawControllIcon extends StatelessWidget {
  final bool isInDrawer;
  final bool isInMenu;

  CustomDrawControllIcon(this.isInDrawer, [this.isInMenu = false]);

  @override
  Widget build(BuildContext context) {
    return (isInMenu)
        ? Container()
        : Container(
            key: ValueKey(VALUE.DRAWER_CONTROLL_ICON),
            child: IconButton(
                icon:
                    (isInDrawer ?? true) ? Icon(Icons.menu) : Icon(Icons.close),
                color: (isInDrawer ?? true) ? Colors.white : inovexAccent,
                iconSize: ScreenSizeHandler().dimen / 20,
                onPressed: () {
                  if (!Scaffold.of(context).isDrawerOpen) {
                    Scaffold.of(context).openDrawer();
                  } else {
                    Navigator.pop(context);
                  }
                }),
          );
  }
}
