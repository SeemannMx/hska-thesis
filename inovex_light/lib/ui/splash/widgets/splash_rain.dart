import 'package:flutter/material.dart';
import 'package:flutter_light/widgets/rain.dart';

class SplashRain extends StatelessWidget {

  final double _width, _height;

  SplashRain(this._width, this._height);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height,
      width: _width,
      child: Rain(),
    );
  }
}