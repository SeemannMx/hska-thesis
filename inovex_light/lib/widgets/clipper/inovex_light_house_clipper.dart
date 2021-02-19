import 'package:flutter/material.dart';
import 'package:flutter_light/widgets/clipper/inovex_house_clipper.dart';
import 'package:flutter_light/widgets/clipper/inovex_logo_clipper.dart';

class InovexLightHouseClipper extends CustomClipper<Path> {
  final path = Path();

  @override
  Path getClip(Size size) {
    final logo  = InovexLogoClipper().getClip(size);
    final house = InovexHouseClipper().getClip(size);

    return path
      ..addPath(logo, Offset.zero)
      ..addPath(house, Offset.zero);
  }

  @override
  bool shouldReclip(InovexLightHouseClipper old) => false;
}