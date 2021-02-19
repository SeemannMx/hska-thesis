import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_light/ui/splash/widgets/splash_light_house.dart';
import 'package:flutter_light/ui/splash/widgets/splash_rain.dart';
import 'package:flutter_light/ui/splash/widgets/splash_title.dart';
import 'package:flutter_light/ui/splash/widgets/splash_waves.dart';
import 'package:flutter_light/utils/key_file.dart';
import 'package:flutter_light/utils/page_initializer.dart';

class SplashPagePortrait extends StatelessWidget with PageHelper {
  @override
  Widget build(BuildContext context) {
    //super.autoNavigate(context);

    return Scaffold(
      key: ValueKey(VALUE.SPLASH_PAGE_SCAFFOLD),
        body: _getBodyWithLayoutBuilder()
      // body: _getBodyWithMediaQuery(context),
      // body: _getRefactoredBody(context),
    );
   }

   _getBodyWithLayoutBuilder() {
    return LayoutBuilder(builder: (context, constraints) {
      Size waveSize = Size(constraints.maxWidth, constraints.maxHeight * 0.125);

      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SplashRain(constraints.maxWidth, constraints.maxHeight * 0.14),
          Container(
            height: constraints.maxHeight * 0.84,
            child: Stack(
              children: [
                SplashLightHouse(constraints.maxHeight),
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SplashTitle(),
                      SplashStartButton(),
                    ],
                  ),
                ),
                SplashWaves(constraints.maxHeight * 0.84, constraints.maxWidth, waveSize )
              ],
            ),
          ),
        ],
      );
    });
   }

   _getBodyWithMediaQuery(BuildContext context){
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Size waveSize = Size(width, height);

    return Stack(
      children: [
        SplashRain(width, height),
        SplashLightHouse(height),
        SplashTitle(),
        SplashStartButton(),
        SplashWaves(height, width, waveSize)
      ],
    );
   }

   _getRefactoredBody(BuildContext context){
     double height = MediaQuery.of(context).size.height;
     double width = MediaQuery.of(context).size.width;

     Size waveSize = Size(width, height * 0.125);

     return Column(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
         SplashRain(width, height * 0.14),
         Container(
           height: height * 0.84,
           child: Stack(
             children: [
               SplashLightHouse(height),
               Container(
                 alignment: Alignment.center,
                 child: Column(
                   mainAxisSize: MainAxisSize.min,
                   children: [
                     SplashTitle(),
                     SplashStartButton(),
                   ],
                 ),
               ),
               SplashWaves(height * 0.84, width, waveSize )
             ],
           ),
         ),
       ],
     );
   }
}
