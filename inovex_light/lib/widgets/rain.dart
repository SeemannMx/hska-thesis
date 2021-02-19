import 'package:flutter/material.dart';
import 'package:flutter_light/utils/custom_colors.dart';
import 'package:flutter_light/utils/key_file.dart';

class Rain extends StatelessWidget {
  final _color;

  Rain([this._color = inovexBlue]);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        key: ValueKey(VALUE.RAIN),
        height: constraints.maxHeight,
        width: constraints.maxWidth,
        child: CustomPaint(
          painter: RainPainter(_color),
        ),
      );
    });
  }
}

class RainPainter extends CustomPainter {
  final Color color;

  Paint _myPaint;

  Offset _start;
  Offset _end;
  double _delta;

  RainPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    _myPaint = Paint()..color = color;

    _delta = size.height / 2;
    _start = Offset(0, 0);
    _end = Offset(0 + _delta, size.height);

    final count = (size.width / _delta).round();

    // draw long line
    canvas..drawLine(_start, _end, _myPaint);
    for (int i = 1; i < count / 2; i++) {
      _start = Offset(_start.dx + (_delta * 2), 0);
      _end = Offset(_end.dx + (_delta * 2), size.height);
      canvas..drawLine(_start, _end, _myPaint);
    }

    _myPaint = Paint()..color = inovexLightBlue;

    // draw short line
    _start = Offset(0 + _delta, 0);
    _end = Offset(_delta + (_delta/2), size.height/2);
    canvas..drawLine(_start, _end, _myPaint);
    for (int i = 1; i < count / 2; i++) {
      _start = Offset(_start.dx + (_delta * 2), 0);
      _end = Offset(_end.dx + (_delta * 2), size.height/2);
      canvas..drawLine(_start, _end, _myPaint);
    }
  }

  @override
  bool shouldRepaint(RainPainter old) => false;
}
