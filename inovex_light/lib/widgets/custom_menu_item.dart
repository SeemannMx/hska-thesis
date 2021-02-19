import 'package:flutter/material.dart';
import 'package:flutter_light/utils/custom_colors.dart';
import 'package:flutter_light/utils/screen_size_handler.dart';

class DrawerMenuItem extends StatelessWidget {
  final Function function;
  final String label;

  const DrawerMenuItem({this.function, this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.adjust_sharp),
        MaterialButton(
          hoverColor: inovexLightBlue,
          splashColor: inovexAccent,
          child: Text(label,
              style: TextStyle(
                  fontSize: ScreenSizeHandler().fontSize.small * 0.75 ,
                  fontFamily: 'Lato',
                  color: inovexDarkGrey)),

          onPressed: () {
            try {
              function();
            } catch (e) {
              print("on pressed $label: $e");
            }
          },
        ),
      ],
    );
  }
}
