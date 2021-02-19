import 'package:flutter/material.dart';
import 'package:flutter_light/utils/custom_colors.dart';
import 'package:flutter_light/utils/key_file.dart';
import 'package:flutter_light/utils/screen_size_handler.dart';
import 'package:flutter_light/widgets/custom_drawer_portrait.dart';
import 'package:flutter_light/widgets/inovex_lighthouse.dart';
import 'package:flutter_light/widgets/mydraw_controll_icon.dart';
import 'package:flutter_light/widgets/rain.dart';
import 'package:flutter_light/widgets/wave.dart';
import 'package:flutter_light/widgets/waves.dart';

class CustomDrawerHeader extends StatelessWidget {
  final double corner;
  final Widget widget;
  final bool isInDrawer;

  CustomDrawerHeader(this.corner, [this.widget, this.isInDrawer]);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        key: ValueKey(VALUE.DRAWER_MENU_HEADER),
        height: constraints.maxHeight / 2,
        child: ClipPath(
          child: (this.widget != null)
              ? widget
              : Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [inovexDarkBlue, inovexBlue])),
                  child: Stack(
                    children: [
                      Container(
                        height: constraints.maxHeight * 0.1,
                        child: Container(
                            child: Rain(Colors.white)),
                      ),
                      Align(
                        alignment: Alignment(0.5, 1),
                        child: InovexLighthouse(
                          Size(constraints.maxWidth * 0.25,
                              constraints.maxHeight * 0.8),
                          Colors.white,
                        ),
                      ),
                      Align(
                        alignment: Alignment(-0.65, -0.15),
                        child: Container(
                          //color: Colors.red,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Column(
                                children: [
                                  Text("inovex",
                                      style: TextStyle(
                                          fontSize: ScreenSizeHandler().fontSize.small * 2,
                                          fontFamily: 'Oleo',
                                          color: Colors.white)),
                                  Text("Light",
                                      style: TextStyle(
                                          fontSize: ScreenSizeHandler().fontSize.small * 2,
                                          fontFamily: 'Oleo',
                                          color: Colors.white))
                                ],
                              ),
                              CustomDrawControllIcon(isInDrawer, false),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: Waves(Size(
                            constraints.maxWidth, constraints.maxHeight * 0.15)),
                      ),
                      Container(
                          alignment: Alignment.bottomCenter,
                          child: AnimatedWave(
                            ValueKey(VALUE.WAVE_LIGHT),
                            height: constraints.maxHeight * 0.1,
                            width: constraints.maxWidth,
                            color: inovexLightBlue.withAlpha(150),
                            speed: 0.6,
                            //offset: pi,
                          )),
                    ],
                  ),
                ),
          clipper: DrawerClipperPortrait(corner * 0.65),
        ),
      );
    });
  }
}
