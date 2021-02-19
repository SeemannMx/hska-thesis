import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:simple_animations/simple_animations.dart';
import 'dart:developer' as dev;

class AnimatedWave extends StatelessWidget {
  final double height;
  final double width;
  final double speed;
  final double offset;
  final Color color;

  AnimatedWave(Key key,
      {this.height, this.width, this.color, this.speed, this.offset = 0.0})
      : super(key: key);

  ///_doSomething();
  /// dev.log('animate', name: 'wave');

  _doSomething() {
    // Todo heavy work
    List list = [];
    int length = 10000;
    for (int i = 0; i < length; i++) {
      Widget w = ListView.builder(
        itemCount: length,
        itemBuilder: (BuildContext context, int index) {
          return Text('$index');
        },
      );
      list.add(w);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        child: LoopAnimation(
            duration: Duration(milliseconds: (5000 / speed).round()),
            tween: Tween(begin: 0.0, end: 2 * pi),
            builder: (context, child, value) {

              return CustomPaint(
                  isComplex: true,
                  willChange: true,
                  painter: CurvePainter((value + offset), color)
              );
            }));
  }
}

class CurvePainter extends CustomPainter {
  final Color color;

  Paint _myPaint;
  Path _myPath;

  double value, _y1, _y2, _y3;
  double _startPointY, _controlPointY, _endPointY;

  CurvePainter(this.value, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    _myPaint = Paint()..color = color;
    _myPath = Path();

    _y1 = sin(value);
    _y2 = sin(value + pi / 2);
    _y3 = sin(value + pi);

    _startPointY = size.height * (0.5 + 0.4 * _y1);
    _controlPointY = size.height * (0.5 + 0.4 * _y2);
    _endPointY = size.height * (0.5 + 0.4 * _y3);

    _myPath
      ..moveTo(size.width * 0, _startPointY)
      ..quadraticBezierTo(
          size.width * 0.5, _controlPointY, size.width, _endPointY)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(_myPath, _myPaint);
  }

  @override
  bool shouldRepaint(CustomPainter old) => true;
}
