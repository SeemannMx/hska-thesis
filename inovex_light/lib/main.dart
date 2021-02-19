import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_light/light_app.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(InovexLightApp());
}
