import 'package:flutter/material.dart';

class InovexHouseClipper extends CustomClipper<Path> {
  final house = Path();

  @override
  Path getClip(Size size) {

    // Left
    house
      ..moveTo(0, 0.6 * size.width)
      ..lineTo(0, size.height)
      ..lineTo(0.465 * size.width, size.height)
      ..lineTo(0.465 * size.width, (size.height - (size.height - (size.width + (size.width * 0.075)))));

    // Right
    house
      ..moveTo(size.width, size.width * 0.6)
      ..lineTo(size.width, size.height)
      ..lineTo(0.535 * size.width, size.height)
      ..lineTo(0.535 * size.width, (size.height - (size.height - (size.width + (size.width * 0.075)))));

    return house;
  }

  @override
  bool shouldReclip(InovexHouseClipper old) => false;
}
