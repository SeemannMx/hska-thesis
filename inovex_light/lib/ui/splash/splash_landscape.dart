import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_light/ui/splash/widgets/splash_light_house.dart';
import 'package:flutter_light/ui/splash/widgets/splash_rain.dart';
import 'package:flutter_light/ui/splash/widgets/splash_title.dart';
import 'package:flutter_light/ui/splash/widgets/splash_waves.dart';
import 'package:flutter_light/utils/key_file.dart';
import 'package:flutter_light/utils/page_initializer.dart';

class SplashPageLandscape extends StatelessWidget with PageHelper {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
        key: ValueKey(VALUE.SPLASH_PAGE_SCAFFOLD),
        body: LayoutBuilder(builder: (context, constraints) {
          Size _waveSize =
              Size(constraints.maxWidth, (constraints.maxHeight * 0.9) * 0.2);

          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SplashRain(constraints.maxWidth, constraints.maxHeight * 0.14),
              Container(
                height: constraints.maxHeight * 0.84,
                child: Stack(
                  children: [
                    SplashLightHouse(constraints.maxHeight),
                    Align(
                      widthFactor: 0.75,
                      heightFactor: 2.5,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SplashTitle(),
                          SplashStartButton(),
                        ],
                      ),
                    ),
                    SplashWaves(constraints.maxHeight * 0.84,
                        constraints.maxWidth, _waveSize)
                  ],
                ),
              ),
            ],
          );
        }));
  }
}
