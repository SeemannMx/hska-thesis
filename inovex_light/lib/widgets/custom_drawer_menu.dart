import 'package:flutter/material.dart';
import 'package:flutter_light/ui/splash/a_splash_page.dart';
import 'package:flutter_light/utils/key_file.dart';
import 'package:flutter_light/widgets/custom_menu_item.dart';
import 'package:flutter_light/widgets/inovex_button.dart';
import 'package:flutter_light/widgets/rain.dart';
import 'package:flutter_light/widgets/waves.dart';

class DrawerMenu extends StatelessWidget {
  final double corner;

  DrawerMenu([this.corner]);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        key: ValueKey(VALUE.DRAWER_MENU),
        width: corner,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.white, Colors.white.withAlpha(200)])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [

            (corner!=null)
                ? Container()
                : Container(
                    height: constraints.maxHeight * 0.1,
                    child: Rain(),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: constraints.maxWidth * 0.1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DrawerMenuItem(label: 'Account',function: null),
                    DrawerMenuItem(label: 'Statistics',function: null),
                    DrawerMenuItem(label: 'Datenschutz',function: null),
                    DrawerMenuItem(label: 'Settings',function: null),
                    DrawerMenuItem(label: 'Onboarding',function: null),
                  ],
                ),
              ),
            ),

            Container(
              width: constraints.maxWidth,

              padding: EdgeInsets.only(
                left: constraints.maxWidth * 0.1,
                right: constraints.maxWidth * 0.1,
                bottom: constraints.maxWidth * 0.05,
              ),

              child: InovexButton(
                label: 'logout',
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.pushReplacementNamed(context, SplashPage.route);
                },
              ),
            ),

            (corner!=null)
                ? Container()
                : Container(
                    height: constraints.maxHeight * 0.1,
                    child: Waves(Size(constraints.maxWidth, constraints.maxHeight)),
            ),
          ],
        ),
      );
    });
  }
}