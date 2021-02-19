import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_light/utils/custom_config.dart';

/// Test Custom Extensions
/// [Key]
/// [String]
/// [WidgetTester]
void main() {
  final String type ='Unit Test';

  group('$type - String Extensions', () {

    test('Modify String for Key Representation', () {
      String testString = 'VALUE.TEST';
      expect(testString.cut(), testString);

      testString = 'TEST';
      expect(testString.cut(), 'VALUE.$testString');
    });
  });

  group('$type - Key Extensions', () {
    test('Extract String Value from Key', () {
      String keyString = 'VALUE.TEST';
      expect(ValueKey(keyString).toKeyString(), keyString);
    });
  });

  group('$type - WidgetTester Extensions', () {
    test('Find Widget with Key', () {

      // Todo Missing implementation

    });
  });
}