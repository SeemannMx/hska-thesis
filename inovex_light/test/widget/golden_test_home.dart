import 'package:flutter/material.dart';
import 'package:flutter_light/ui/home/a_home_page.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_setup.dart';

/// run golden test with
/// $ flutter test --update-goldens test/widget/golden_test_home.dart
void main() {

  Widget app = MaterialApp(
      home: HomePage()
  );

  group('Golden Tests - Home', () {
    testWidgets('Golden test - Home Page Portrait', (WidgetTester tester) async {
      initSmallPortrait();

      await tester.runAsync(() => tester.pumpWidget(app));
      await expectLater(
          find.byType(app.runtimeType),
          matchesGoldenFile('golden_images/gold_home_page_portrait.png')
      );
      dispose();
    });


    testWidgets('Golden test - Home Page Landscape', (WidgetTester tester) async {
      initMediumLandscape();

      await tester.runAsync(() => tester.pumpWidget(app));
      await expectLater(
          find.byType(app.runtimeType),
          matchesGoldenFile('golden_images/gold_home_page_landscape.png')
      );
      dispose();
    });
  });
}