import 'package:flutter/material.dart';
import 'package:flutter_light/ui/splash/a_splash_page.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_setup.dart';

/// run golden test with
/// $ flutter test --update-goldens test/widget/golden_test_splash.dart
void main() {
  final Widget widget = SplashPage();
  final Widget app = MaterialApp(home: widget);

  group('Golden Tests - $widget', () {
    testWidgets('Small Portrait', (WidgetTester tester) async {
      initSmallPortrait();

      await tester.runAsync(() => tester.pumpWidget(app));
      await expectLater(
          find.byType(app.runtimeType),
          matchesGoldenFile('golden_images/gold_splash_page_portrait.png')
      );
      dispose();
    });

    testWidgets('Medium Landscape', (WidgetTester tester) async {
      initMediumLandscape();
      await tester.runAsync(() => tester.pumpWidget(app));
      await expectLater(
          find.byType(app.runtimeType),
          matchesGoldenFile('golden_images/gold_splash_page_landscape.png')
      );
      dispose();
    });
  });
}