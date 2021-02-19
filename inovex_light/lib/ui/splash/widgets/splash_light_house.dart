import 'package:flutter/material.dart';
import 'package:flutter_light/widgets/inovex_lighthouse.dart';

class SplashLightHouse extends StatelessWidget {

  final double _height;

  SplashLightHouse(this._height);

  @override
  Widget build(BuildContext context) {
    double lightHouseWidth = _height * 0.2;
    double lightHouseHeight = _height * 0.8;

    return Align(
      alignment: Alignment(0.5 , 1),
      child: Container(
        height: lightHouseHeight,
        child: InovexLighthouse(Size(lightHouseWidth,
            lightHouseHeight)),
      ),
    );
  }
}