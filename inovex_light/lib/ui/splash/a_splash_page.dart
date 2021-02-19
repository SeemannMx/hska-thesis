import 'package:flutter/material.dart';
import 'package:flutter_light/ui/splash/splash_landscape.dart';
import 'package:flutter_light/ui/splash/splash_portrait.dart';
import 'package:flutter_light/utils/page_initializer.dart';
import 'package:flutter_light/utils/screen_size_handler.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatelessWidget with PageInitializer {

  static String route = "/splash";

  @override
  Widget build(BuildContext context) {
    super.initScreenSize(context);
    return useSinglton(context);
  }

  Widget useProvider(BuildContext context){

    // Provider
    final provider = Provider.of<ScreenSizeHandler>(context);

    provider.initScreen(
        MediaQuery.of(context).size.height,
        MediaQuery.of(context).size.width);

    if (provider.myScreenSize == ScreenSize.FALLBACK)
      return Placeholder();

    return (provider.myOrientation == ScreenOrientation.PORTRAIT)
              ? SplashPagePortrait()
              : SplashPageLandscape();
  }

  Widget useSinglton(BuildContext context){

    // ScreenSizeHandler
    if (ScreenSizeHandler().myScreenSize == ScreenSize.FALLBACK)
      return Placeholder();

    return (ScreenSizeHandler().myOrientation == ScreenOrientation.PORTRAIT)
        ? SplashPagePortrait()
        : SplashPageLandscape();
  }
}




