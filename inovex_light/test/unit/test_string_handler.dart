import 'package:flutter_test/flutter_test.dart';

import '../test_case.dart';

void main() {
  final String type = 'Unit Test';
  final String label = 'StringHandler';

  String testString;
  final handler = StringHandler();

  group('$type', () {
    test('$label - Find Key in String', () {
      expect(handler.findKeyStringsIn(testString).length, 0);
    });
  });
}