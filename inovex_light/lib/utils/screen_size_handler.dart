import 'dart:math';
import 'package:flutter_light/models/fontsize.dart';

enum ScreenSize {
  SMALL,
  MEDIUM,
  FALLBACK
}

enum ScreenOrientation {
  LANDSCAPE,
  PORTRAIT,
}

class ScreenSizeHandler {
  static final ScreenSizeHandler _screenSizeHandler =
      ScreenSizeHandler._internal();

  factory ScreenSizeHandler() => _screenSizeHandler;

  double height;
  double width;
  double dimen;
  ScreenSize myScreenSize;
  ScreenOrientation myOrientation;
  FontSize fontSize = FontSize();

  double drawerCorner;
  bool showWaves = true;

  ScreenSizeHandler._internal();

  void initScreen(double height, double width) {
    this.height = height;
    this.width = width;
    this.dimen = (height + width) / 2;

    _setScreenSize();
    _setFontSize();
    _setScreenOrientation();
  }

  void _setScreenSize() {
    double diagonal = sqrt(pow(height, 2) + pow(width, 2));

    if (diagonal < 600 || width < 300 || height < 300) {
      myScreenSize = ScreenSize.FALLBACK;
    } else if (diagonal > 0 && diagonal < 1000) {
      myScreenSize = ScreenSize.SMALL;
    } else {
      myScreenSize = ScreenSize.MEDIUM;
    }
  }

  void _setScreenOrientation() {
    //dev.log('${MediaQuery.of(context).orientation}',name: this.runtimeType.toString());

    if (height < width) {
      myOrientation = ScreenOrientation.LANDSCAPE;
    } else {
      myOrientation = ScreenOrientation.PORTRAIT;
    }
  }

  void _setFontSize() {
    if (myScreenSize == ScreenSize.SMALL) {
      fontSize
        ..tiny = dimen * 0.03
        ..small = dimen * 0.03
        ..medium = dimen * 0.035
        ..large = dimen * 0.04;
    } else if (myScreenSize == ScreenSize.MEDIUM) {
      fontSize
        ..tiny = dimen * 0.02
        ..small = dimen * 0.025
        ..medium = dimen * 0.03
        ..large = dimen * 0.035;
    } else {
      // print("ScreenSizeHandler: set Placeholder");
    }
  }
}
