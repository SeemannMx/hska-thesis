import 'package:flutter/material.dart';
import 'package:flutter_light/usecases/audit_provider.dart';
import 'package:flutter_light/usecases/fake_provider.dart';
import 'package:flutter_light/utils/key_file.dart';
import 'package:flutter_light/utils/screen_size_handler.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:flutter_light/utils/custom_config.dart';

import 'dart:developer' as dev;

abstract class BasePageTest {
  String label;
  WidgetTester tester;
  Widget testWidget;

  BasePageTest() {
    label = this.runtimeType.toString();
  }
  Future<void> run(Widget widget);
  Future<void> prepare();
}

Size smallPortrait = Size(400, 600);
Size smallLandscape = Size(600, 400);
Size mediumPortrait = Size(800, 1200);
Size mediumLandscape = Size(1200, 800);

TestWidgetsFlutterBinding binding;

void initSmallPortrait(){
  binding = TestWidgetsFlutterBinding.ensureInitialized();
  binding.window.physicalSizeTestValue = smallPortrait;
  binding.window.devicePixelRatioTestValue = 1.0;
}

void initSmallLandscape(){
  binding = TestWidgetsFlutterBinding.ensureInitialized();
  binding.window.physicalSizeTestValue = smallLandscape;
  binding.window.devicePixelRatioTestValue = 1.0;
}

void initMediumPortrait(){
  binding = TestWidgetsFlutterBinding.ensureInitialized();
  binding.window.physicalSizeTestValue = mediumPortrait;
  binding.window.devicePixelRatioTestValue = 1.0;
}

void initMediumLandscape(){
  binding = TestWidgetsFlutterBinding.ensureInitialized();
  binding.window.physicalSizeTestValue = mediumLandscape;
  binding.window.devicePixelRatioTestValue = 1.0;
}

void dispose(){
  binding.window.clearPhysicalSizeTestValue();
}

void details(){
  print(ScreenSizeHandler().myScreenSize);
  print(ScreenSizeHandler().myOrientation);
}

bool isDeclared(Widget widget) {
  return widget.key != null
      && !(widget.runtimeType.toString().startsWith("_"))
      && !(widget.key.toString().contains("Global"))
      && !(widget.key.toString().contains("Slot"))
      ? true : false;
}

bool isProvider(Widget widget){
  return widget.key != null
      ? true : false;
}


bool foundKeyFor(Widget widget){
  bool result = false;

  VALUE.values
      ..where((keyValue) => widget.key.toKeyString() == keyValue.toString())
      ..forEach((foundValue) => result = true);

  return result;
}

Future <void> before(WidgetTester tester, Widget page, [globalKey]) async{
  return await tester.runAsync(() => tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<AuditProvider>(create: (_) => FakeProvider()),
        ],
        child: MaterialApp(
          key: globalKey,
          home: page,
        ),
      )
  ));
}
