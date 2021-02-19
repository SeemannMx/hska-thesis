import 'package:flutter/material.dart';
import 'package:flutter_light/widgets/waves.dart';

class SplashWaves extends StatelessWidget {

  final double _height, _width;
  final Size _waveSize;

  SplashWaves(this._height, this._width, this._waveSize);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: _height,
      width: _width,
      child: Waves(_waveSize),
    );
  }
}
