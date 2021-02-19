import 'package:flutter/material.dart';
import 'package:flutter_light/utils/custom_colors.dart';
import 'package:flutter_light/utils/key_store.dart';
import 'package:flutter_light/utils/screen_size_handler.dart';

class InovexButton extends StatelessWidget {

  const InovexButton({
    @required this.onPressed,
    @required this.label,
  });

  final String label;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    double radius = MediaQuery.of(context).size.width / 95;

    return Container(
      child: RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius / 2),
          ),
          color: inovexBlue.shade600,
          textColor: Colors.white,
          splashColor: inovexLightBlue,
          onPressed: onPressed,
          child: Padding(
            padding: EdgeInsets.all(radius / 2),
            child: Text(label,
                style: TextStyle(
                    fontSize: ScreenSizeHandler().fontSize.small * 0.65,
                    fontFamily: 'Lato',
                    color: Colors.white)
            )
          )
      ),
    );
  }
}

class CustomButton extends StatelessWidget {

  const CustomButton(this.onPressed, [this.widget, this.label] );

  final widget;
  final String label;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    double radius = MediaQuery.of(context).size.width / 20;

    return Container(
      alignment: Alignment.center,
      child: RaisedButton(
          key: ValueKey(KeyStore.SPLASH_START_BUTTON),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius / 2),
          ),
          color: inovexBlue.shade600,
          textColor: Colors.white,
          splashColor: inovexLightBlue,
          onPressed: onPressed,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: radius / 2),
              child: widget == null
                  ? Text(label,
                  style: TextStyle(
                      fontSize: ScreenSizeHandler().fontSize.small * 0.65,
                      fontFamily: 'Lato',
                      color: Colors.white))
                  : widget
          )
      ),
    );
  }
}
