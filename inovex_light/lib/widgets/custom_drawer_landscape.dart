import 'package:flutter/material.dart';
import 'package:flutter_light/utils/key_file.dart';
import 'package:flutter_light/widgets/custom_drawer_menu.dart';

class DrawerLandscape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      key: ValueKey(VALUE.DRAWER_LANDSCAPE),
      child: Theme(
        data: ThemeData(canvasColor: Colors.transparent),
        child: Drawer(
          elevation: 0,
          child: Container(
          child: ClipPath(
            child: DrawerMenu(),
            clipper: DrawerClipperLandscape(),
          ),)
        ),
      ),
    );
  }
}

class DrawerClipperLandscape extends CustomClipper<Path> {
  final path = Path();
  double corner;

  @override
  Path getClip(Size size) {
    corner = (size.width  + size.height) / 15;

    return path
      ..moveTo(0, 0)
      ..lineTo(0, size.height)
      ..lineTo(size.width - corner, size.height)
      ..lineTo(size.width, size.height - corner)
      ..lineTo(size.width, corner)
      ..lineTo(size.width - corner, 0)
      ..lineTo(size.width, 0)
      ..close();
  }

  @override
  bool shouldReclip(DrawerClipperLandscape old) => false;
}
