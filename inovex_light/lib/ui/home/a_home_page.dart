import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_light/ui/home/home_landscape.dart';
import 'package:flutter_light/ui/home/home_portrait.dart';
import 'package:flutter_light/utils/page_initializer.dart';
import 'package:flutter_light/utils/screen_size_handler.dart';

class HomePage extends StatelessWidget with PageInitializer {
  static String route = "/home";

  @override
  Widget build(BuildContext context) {
    super.initScreenSize(context);

    if (ScreenSizeHandler().myScreenSize == ScreenSize.FALLBACK)
      return Placeholder();

    return (ScreenSizeHandler().myOrientation == ScreenOrientation.PORTRAIT)
        ? HomePagePortrait()
        : HomePageLandscape();
  }
}
