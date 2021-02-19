import 'package:flutter/material.dart';
import 'package:flutter_light/ui/splash/a_splash_page.dart';
import 'package:flutter_light/utils/custom_colors.dart';
import 'package:flutter_light/utils/key_file.dart';
import 'package:flutter_light/utils/custom_config.dart';
import 'package:flutter_light/widgets/wave.dart';
import 'package:flutter_test/flutter_test.dart';
import '../test_case.dart';
import '../test_setup.dart';

void main() {
  final Widget widget = SplashPage();

  group("$widget Widgets Configuration", () {

    testWidgets('Medium Landscape - All Widgets-Colors are proper displayed', (WidgetTester tester) async {
      initSmallPortrait();
      await before(tester, widget);

      AnimatedWave wave = tester.widgetWithKey(VALUE.WAVE_LIGHT);
      expect(wave.color, inovexLightBlue.withAlpha(125));

      dispose();
    });

    testWidgets('Medium Landscape - All Widgets-Colors are proper displayed', (WidgetTester tester) async {
      initSmallPortrait();
      await before(tester, widget);

      var color = (tester.widgetWithKey(VALUE.INOVEX_LOGO) as Container).color;
      expect(color, inovexBlue);

      color = (tester.widgetWithKey(VALUE.INOVEX_HOUSE) as Container).color;
      expect(color, inovexLightGrey);

      color = (tester.widgetWithKey(VALUE.WAVE_DARK) as AnimatedWave).color;
      expect(color, inovexDarkBlue);

      color = (tester.widgetWithKey(VALUE.WAVE_BLUE) as AnimatedWave).color;
      expect(color, inovexBlue.withAlpha(200));

      color = (tester.widgetWithKey(VALUE.WAVE_LIGHT) as AnimatedWave).color;
      expect(color, inovexLightBlue.withAlpha(125));

      dispose();
    });

    testWidgets('Medium Landscape - All Widgets-Labels are proper displayed', (WidgetTester tester) async {
      initSmallPortrait();
      await before(tester, widget);

      expect(find.text('start'), findsOneWidget );

      dispose();
    });
  });

  group("$widget Page Find Widgets", () {

    testWidgets('Small Portrait - Find Widgets with in Gherkin Format', (WidgetTester tester) async {
          initSmallPortrait();
          await before(tester, widget);

          TestCase().run(
              description: "Find Start all Common Widgets at the Splash-Page",
              given: 'I expect to Tino find ${VALUE.RAIN}, ${VALUE.WAVES} and ${VALUE.LIGHTHOUSE}',
              tester: tester,
              widget: widget,
          );

          TestCase().run(
            description: "Find Start all Page-Specific Widgets at the Splash-Page",
            given: 'I expect to find SPLASH_PAGE_SCAFFOLD and SPLASH_PAGE_TITLE',
            tester: tester,
            widget: widget,
          );
          dispose();
        });


    testWidgets('Small Portrait - Find Widgets with WidgetTester', (WidgetTester tester) async {
      initSmallPortrait();
      await before(tester, widget);

      tester
          .allWidgets
          .where((widget) => isDeclared(widget))
          .forEach((declaredWidget) => expect(foundKeyFor(declaredWidget), true));

      dispose();
    });

    /// Todo Experimental
    testWidgets('Custom Test', (WidgetTester tester) async {
      initSmallPortrait();

      Widget w = Directionality(
          textDirection: TextDirection.ltr,
          child: Text("ABC", key: Key('XYZ'),));

      await tester.pumpWidget(w);
      expect(find.byKey(Key("XYZ")), findsOneWidget);

      dispose();
    });

  });
}
