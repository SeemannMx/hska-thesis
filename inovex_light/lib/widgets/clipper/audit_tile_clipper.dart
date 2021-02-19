import 'package:flutter/material.dart';

class AuditTileClipper extends CustomClipper<Path> {
  final Path path = Path();
  double corner;

  AuditTileClipper(this.corner);

  @override
  Path getClip(Size size) {
    corner /= 3.4;
    return path
      ..moveTo(0, 0)
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, size.height - (size.height - corner))
      ..lineTo(size.width - corner, 0)
      ..close();
  }

  @override
  bool shouldReclip(AuditTileClipper old) => false;
}
