import 'package:flutter/material.dart';

class BlogTileClipper extends CustomClipper<Path> {
  final Path path = Path();
  double corner;

  BlogTileClipper(this.corner);

  @override
  Path getClip(Size size) {
    corner /= 3.4;
    return path
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0 + corner, size.height)
      ..lineTo(0, size.height - corner)
      ..close();
  }

  @override
  bool shouldReclip(BlogTileClipper old) => false;
}
