import 'package:flutter/material.dart';
import 'package:flutter_light/utils/key_file.dart';
import 'package:flutter_light/widgets/custom_drawer_menu.dart';
import 'package:flutter_light/widgets/custom_menu_header.dart';

class DrawerPortrait extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      key: ValueKey(VALUE.DRAWER_PORTRAIT),
      child: Theme(
        data: ThemeData(canvasColor: Colors.transparent),
        child: Drawer(
          elevation: 0,
          child: LayoutBuilder(builder: (context, constraints) {
            double corner = constraints.maxWidth * 0.65;
            return Column(
              children: [
                Container(
                  height: constraints.maxHeight / 2,
                  width: constraints.maxWidth,
                  child: CustomDrawerHeader(corner * 1.535, null, false),
                ),
                Container(
                  height: constraints.maxHeight / 2,
                  alignment: Alignment.centerLeft,
                  child: DrawerMenu(corner),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}

class DrawerClipperPortrait extends CustomClipper<Path> {
  final path = Path();
  double corner;

  DrawerClipperPortrait(this.corner);

  @override
  Path getClip(Size size) {
    corner = size.width - corner;

    return path
      ..moveTo(0, 0)
      ..lineTo(0, size.height)
      ..lineTo(size.width - corner, size.height)
      ..lineTo(size.width, size.height - corner)
      ..lineTo(size.width, 0)
      ..close();
  }

  @override
  bool shouldReclip(DrawerClipperPortrait old) => false;
}
