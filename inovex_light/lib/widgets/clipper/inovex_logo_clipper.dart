import 'package:flutter/widgets.dart';

class InovexLogoClipper extends CustomClipper<Path> {
  final path = Path();

  @override
  Path getClip(Size size) {

    // Left
    path
      ..moveTo(0.489 * size.width, 0)
      ..lineTo(0.02 * size.width, 0.469 * size.width)
      ..lineTo(0.569 * size.width, 0.338 * size.width);
    // Upper
    path
      ..moveTo(0.511 * size.width, size.width)
      ..lineTo(0.98 * size.width, 0.531 * size.width)
      ..lineTo(0.431 * size.width, 0.662 * size.width);
    // Right
    path
      ..moveTo(size.width, 0.489 * size.width)
      ..lineTo(0.531 * size.width, 0.02 * size.width)
      ..lineTo(0.663 * size.width, 0.569 * size.width);
    // Lower
    path
      ..moveTo(0, 0.511 * size.width)
      ..lineTo(0.469 * size.width, 0.98 * size.width)
      ..lineTo(0.337 * size.width, 0.431 * size.width);
    return path;
  }

  @override
  bool shouldReclip(InovexLogoClipper old) => false;
}
