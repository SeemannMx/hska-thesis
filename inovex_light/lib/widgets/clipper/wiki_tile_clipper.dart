import 'package:flutter/material.dart';

class WikiTileClipper extends CustomClipper<Path> {
  final Path path = Path();
  double corner;
  double corr;

  WikiTileClipper(this.corner);

  @override
  Path getClip(Size size) {
    corner /= 3.55;
    corr = corner * 0.02;

    return path
        ..moveTo(0, size.height)
        ..lineTo(size.width, size.height)
        ..lineTo(size.width, corr)
        ..lineTo(size.width - corner,  corr)
        ..lineTo(0, corner + 3*corr)
        ..close();
  }

  @override
  bool shouldReclip(WikiTileClipper old) => false;
}

class WikiTileClipperLandscape extends CustomClipper<Path> {
  final Path path = Path();
  double corner;

  WikiTileClipperLandscape(this.corner);

  @override
  Path getClip(Size size) {
    corner /= 3.4;
    return path
      ..moveTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0)
      ..lineTo(corner,  0)
      ..lineTo(0, corner)
      ..close();
  }

  @override
  bool shouldReclip(WikiTileClipperLandscape old) => false;
}