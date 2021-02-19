import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_light/utils/custom_colors.dart';
import 'package:flutter_light/utils/key_file.dart';
import 'package:flutter_light/widgets/wave.dart';

class Waves extends StatelessWidget {

  Waves(this._size);
  final Size _size;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: ValueKey(VALUE.WAVES),
      child: Stack(
        children: <Widget>[

          Container(
            alignment: Alignment.bottomCenter,
            child: AnimatedWave(
              ValueKey(VALUE.WAVE_DARK),
              height: _size.height + _size.height * 0.1,
              width: _size.width,
              color: inovexDarkBlue,
              speed: 0.5,
            ),
          ),

          Container(
              alignment: Alignment.bottomCenter,
              child: AnimatedWave(
                ValueKey(VALUE.WAVE_BLUE),
                height: _size.height * 0.9,
                width: _size.width,
                color: inovexBlue.withAlpha(200),
                speed: 0.55,
                //offset: pi,
              )
          ),

          Container(
              alignment: Alignment.bottomCenter,
              child: AnimatedWave(
                ValueKey(VALUE.WAVE_LIGHT),
                height: _size.height  * 0.75,
                width: _size.width,
                color: inovexLightBlue.withAlpha(125),
                speed: 0.6,
                //offset: pi * 2,
              )
          ),
        ],
      ),
    );
  }
}
