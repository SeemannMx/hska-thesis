import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SplashWind extends StatelessWidget {

  final Widget child;

  SplashWind({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: Key('SPLASH_WIND'),
      child: this.child,
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage("assets/images/wind_portrait.png"),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
