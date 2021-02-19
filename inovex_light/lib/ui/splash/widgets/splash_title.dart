import 'package:flutter/material.dart';
import 'package:flutter_light/ui/home/a_home_page.dart';
import 'package:flutter_light/utils/custom_colors.dart';
import 'package:flutter_light/utils/page_initializer.dart';
import 'package:flutter_light/utils/screen_size_handler.dart';
import 'package:flutter_light/widgets/inovex_button.dart';

class SplashTitle extends StatelessWidget with PageHelper {
  @override
  Widget build(BuildContext context) {
    return Text('inovex Light',
        style: TextStyle(
            fontSize: ScreenSizeHandler().fontSize.large * 2.5,
            fontFamily: 'Oleo',
            color: inovexDarkBlue));
  }
}

class SplashStartButton extends StatelessWidget with PageHelper {
  @override
  Widget build(BuildContext context) {
    return CustomButton(
        () => Navigator.pushNamed(context, HomePage.route),
        Text(
          "start",
          style: TextStyle(
              fontSize: ScreenSizeHandler().fontSize.small,
              fontFamily: 'Lato',
              color: Colors.white),
        ));
  }
}
