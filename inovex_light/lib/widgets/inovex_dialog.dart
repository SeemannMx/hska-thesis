import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_light/utils/custom_colors.dart';
import 'package:flutter_light/utils/screen_size_handler.dart';

//typedef ButtonCallback = void Function(BuildContext context);
typedef ButtonCallback = void Function();

class InovexDialog extends StatelessWidget {
  final String title;
  final String content;
  final String leftLabel;
  final String rightLabel;
  final ButtonCallback leftButtonCallback;
  final ButtonCallback rightButtonCallback;

  InovexDialog({
    @required this.title,
    @required this.content,
    @required this.leftLabel,
    @required this.rightLabel,
    @required this.leftButtonCallback,
    @required this.rightButtonCallback,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.65;
    double width = MediaQuery.of(context).size.width * 0.75;

    return Dialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Container(
          height: height,
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _getDialog(height),
              _getButtonRow(),
            ],
          ),
        ));
  }

  Widget _getDialog(double height){
    return Container(
      height: height * .85,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ScreenSizeHandler().dimen / 100),
        color: Colors.white,
      ),
      child: Column(
        children: [
          _getHeader(),
          _getBody()
        ],
      ),
    );
  }

  Widget _getHeader(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: ScreenSizeHandler().dimen / 100),
      child: Column(
        children: [
          Text(this.title, style: TextStyle(fontSize: ScreenSizeHandler().fontSize.medium, color: inovexDarkBlue)),
          Divider(color: inovexDarkBlue, thickness: 0.25, indent: ScreenSizeHandler().dimen / 50, endIndent: ScreenSizeHandler().dimen / 50,
          ),
        ],
      ),
    );
  }

  Widget _getBody() {
    return Expanded(
      child: Container(
        alignment: Alignment.topCenter,
        // padding: EdgeInsets.symmetric(horizontal: ScreenSizeHandler().width / 25),
        padding: EdgeInsets.only(left: ScreenSizeHandler().width / 25, right: ScreenSizeHandler().width / 25, bottom: ScreenSizeHandler().width / 25),
        child: SingleChildScrollView(child: Text(this.content)),
      ),
    );
  }

  Widget _getButtonRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[_getLeftButtonWidget(), _getRightButtonWidget()],
    );
  }

  Widget _getLeftButtonWidget() {
    return InoButtonDialog(
      alignment: Alignment.topLeft,
      onPressed: this.leftButtonCallback,
      child: Text(leftLabel, style:TextStyle(fontSize: ScreenSizeHandler().fontSize.tiny, fontFamily: 'Lato', color: Colors.white)),
    );
  }

  Widget _getRightButtonWidget() {
    return InoButtonDialog(
      alignment: Alignment.topRight,
      onPressed: this.rightButtonCallback,
      child: Text(rightLabel, style:TextStyle(fontSize: ScreenSizeHandler().fontSize.tiny, fontFamily: 'Lato', color: Colors.white)),
    );
  }
}

class InoButtonDialog extends StatelessWidget {
  final Widget child;
  final Alignment alignment;
  final ButtonCallback onPressed;

  InoButtonDialog({
    @required this.alignment,
    @required this.onPressed,
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    double radius = MediaQuery.of(context).size.width / 30;

    return RaisedButton(
        shape: _getShape(radius),
        color: inovexBlue,
        textColor: Colors.white,
        splashColor: inovexLightBlue,
        onPressed: onPressed,
        child: Padding(
          padding: EdgeInsets.all(radius / 4),
          child: child,
        ));
  }

  ShapeBorder _getShape(double radius) {
    return RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
      topLeft: this.alignment == Alignment.topLeft
          ? Radius.zero
          : Radius.circular(radius),
      topRight: this.alignment == Alignment.topRight
          ? Radius.zero
          : Radius.circular(radius),
      bottomLeft: this.alignment == Alignment.bottomLeft
          ? Radius.zero
          : Radius.circular(radius),
      bottomRight: this.alignment == Alignment.bottomRight
          ? Radius.zero
          : Radius.circular(radius),
    ));
  }
}
