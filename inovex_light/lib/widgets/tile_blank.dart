import 'package:flutter/material.dart';
import 'package:flutter_light/utils/custom_colors.dart';

class BlankTile extends StatelessWidget {

  final Size _size;
  final double corner;
  final Widget widget;

  BlankTile(this._size, this.corner, this.widget);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _size.width,
      height: _size.height,
      child: ClipPath(
        child: Container(
          child: widget,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  colors: [inovexBlue.shade700, inovexDarkBlue])
          ),
        ),
        clipper: BlankClipper(corner),
      ),
    );
  }
}

class BlankClipper extends CustomClipper<Path> {
  final path = Path();
  double corner;

  BlankClipper(this.corner);

  @override
  Path getClip(Size size) {
    corner /= 3.4;
    return path
      ..moveTo(0, 0)
      ..lineTo(0, size.height)
      ..lineTo(size.width - corner, size.height)
      ..lineTo(size.width, size.height - corner)
      ..lineTo(size.width, 0)
      ..close();
  }

  @override
  bool shouldReclip(BlankClipper old) => false;
}

