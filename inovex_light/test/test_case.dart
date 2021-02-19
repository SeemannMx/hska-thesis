import 'package:flutter/material.dart';
import 'package:flutter_light/utils/key_file.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:string_validator/string_validator.dart';
import 'package:flutter_light/utils/custom_config.dart';

import 'test_setup.dart';

class TestCase {
  static final TestCase _testCase = TestCase._internal();
  factory TestCase() => _testCase;TestCase._internal();

  /// TestCase.run(...)
  /// Describe your testcase within the [description]
  /// and provide Key String in the [given] attribute.
  void run({String description, String given, String when, String then, WidgetTester tester, Widget widget}){
    StringHandler().findKeyStringsIn(given).forEach((keyString) {
      tester.allWidgets.forEach((widget) {
        if (isDeclared(widget)) {
          expect(foundKeyFor(widget), true);
        }
      });
    });
  }
}

class StringHandler {
  static final StringHandler _stringHandler = StringHandler._internal();
  factory StringHandler() => _stringHandler;

  StringHandler._internal();

  List<String> _foundKeys = [];

  List <String> findKeyStringsIn(String given){
    if(given == null) return [];
    given.split(" ")
      ..removeWhere((word) => _isNotKey(word))
      ..forEach((possibleKeyString) {
        VALUE.values
            .where((keyString) => (keyString.toString() == possibleKeyString.cut()))
            .forEach((key) => _foundKeys.add(key.toString())
        );
      });
    return _foundKeys;
  }

  bool _isNotKey(String word) {
    return (word.length <= 1 || !isUppercase(word) || isLowercase(word) );
  }
}