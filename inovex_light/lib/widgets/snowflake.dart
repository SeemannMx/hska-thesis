import 'package:flutter/material.dart';
import 'package:flutter_light/utils/custom_colors.dart';

class SnowFlake extends StatelessWidget {
  final _color;

  SnowFlake([this._color = inovexBlue]);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        width: 100,
        child: CustomPaint(painter: SnowFlakePainter(_color)));
  }
}

class SnowFlakePainter extends CustomPainter  {
  Paint _paint = Paint();
  final Color _color;

  SnowFlakePainter(this._color);

  @override
  void paint(Canvas canvas, Size size) {
    _paint = Paint()..color = this._color;
    canvas
      ..drawLine(Offset(0,0), Offset(size.width, size.height), _paint)
      ..drawLine(Offset(size.width,0), Offset(0, size.height), _paint)
      ..drawLine(Offset(0,size.height / 2), Offset(size.width, size.height / 2), _paint)
      ..drawLine(Offset(size.width / 2, 0), Offset(size.width / 2, size.height), _paint);
  }

  @override
  bool shouldRepaint(CustomPainter old) => false;
}
