import 'package:flutter/material.dart';
import 'package:flutter_light/utils/custom_colors.dart';
import 'package:flutter_light/utils/key_file.dart';
import 'package:flutter_light/widgets/clipper/inovex_house_clipper.dart';
import 'package:flutter_light/widgets/clipper/inovex_logo_clipper.dart';

class InovexLighthouse extends StatelessWidget {
  final Size _size;
  final colorLogo;
  final colorHouse;
  final widget;

  const InovexLighthouse(this._size, [this.colorLogo = inovexBlue , this.colorHouse = inovexLightGrey, this.widget]);

  @override
  Widget build(BuildContext context) {
    return Container(
        key: ValueKey(VALUE.LIGHTHOUSE),
        width:  _size.width,
        height: _size.height,
        child:   Stack(
          children: [
            Stack(children: [
              Align(
                alignment: Alignment.topCenter,
                child: widget,
              ),
              ClipPath(
                child: Container(
                  key: ValueKey(VALUE.INOVEX_LOGO),
                  color: colorLogo,
                  //color: inovexAccent
                ),
                clipper: InovexLogoClipper(),
              ),
            ],),
            ClipPath(
              child: Container(
                key: ValueKey(VALUE.INOVEX_HOUSE),
                color: colorHouse,
              ),
              clipper: InovexHouseClipper(),
            ),
          ],
        )
    );
  }
}


