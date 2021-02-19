import 'package:flutter/material.dart';
import 'package:flutter_light/ui/home/widgets/home_wave.dart';
import 'package:flutter_light/utils/custom_colors.dart';
import 'package:flutter_light/utils/key_file.dart';
import 'package:flutter_light/utils/page_initializer.dart';
import 'package:flutter_light/utils/screen_size_handler.dart';
import 'package:flutter_light/widgets/custom_drawer.dart';
import 'package:flutter_light/widgets/home_content.dart';
import 'package:flutter_light/widgets/inovex_lighthouse.dart';
import 'package:flutter_light/widgets/rain.dart';

class HomePageLandscape extends StatelessWidget with PageHelper {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: ValueKey(VALUE.HOME_PAGE_SCAFFOLD),
        drawer: CustomDrawer(),
        drawerScrimColor: Colors.black45.withAlpha(210),
        body: LayoutBuilder(builder: (context, constraints) {
          double waveHeight = constraints.maxHeight * 0.15;
          return Stack(
            children: [
              _getContent(constraints),
              _getRain(waveHeight),
              _getMenu(context, constraints),
              ScreenSizeHandler().showWaves
                  ? _getBottomWaves(waveHeight, constraints)
                  : Container(),
              _getBottomInfo(waveHeight, constraints)
            ],
          );
        }));
  }

  Widget _getRain(double waveHeight) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(height: waveHeight / 2, child: Rain()),
    );
  }

  Widget _getContent(BoxConstraints constraints) {
    double padding = ScreenSizeHandler().dimen / 4;

    return Container(
      height: constraints.maxHeight,
      width: constraints.maxWidth,
      padding: EdgeInsets.only(
          left: padding * 1.15,
          right: padding / 3,
          top: padding / 1.75,
          bottom: padding / 1.75
      ),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [inovexLightGrey, inovexDarkBlue])),
      child: HomeContentCards(),
    );
  }

  Widget _getMenu(BuildContext context, BoxConstraints constraints) {
    double margin = ScreenSizeHandler().dimen / 20;

    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        key: ValueKey(VALUE.HOME_PAGE_MENU),
        height: constraints.maxHeight * 0.9,
        width: constraints.maxWidth * 0.125,
        margin: EdgeInsets.only(left: margin, top: margin),
        child: Stack(
          children: [
            InovexLighthouse(
              Size(constraints.maxWidth, constraints.maxHeight),
              inovexLightGrey,
              inovexLightGrey,
              Container(
                height: constraints.maxWidth * 0.125,
                width: constraints.maxWidth * 0.125,
                child: IconButton(
                    icon: Icon(Icons.menu),
                    color: inovexLightGrey,
                    iconSize: ScreenSizeHandler().dimen / 30,
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getBottomWaves(double waveHeight, BoxConstraints constraints) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
          height: waveHeight,
          child: HomeWaves(Size(constraints.maxWidth, waveHeight))),
    );
  }

  Widget _getBottomInfo(double waveHeight, BoxConstraints constraints) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
          key: ValueKey(VALUE.HOME_PAGE_BOTTOM_BAR),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, inovexDarkBlue])),
          height: waveHeight / 2,
          width: constraints.maxWidth,
          child: Center(
              child: MaterialButton(
                onPressed: () =>
                ScreenSizeHandler().showWaves =
                !ScreenSizeHandler().showWaves,
                hoverColor: inovexLightBlue,
                child: Text(
                  "Impressum  |  Waves  |  Datenschutz",
                  style: TextStyle(
                      fontSize: ScreenSizeHandler().fontSize.tiny / 1.35,
                      fontFamily: 'Lato',
                      color: inovexDarkGrey
                  ),
                ),
              )
          )),
    );
  }
}
