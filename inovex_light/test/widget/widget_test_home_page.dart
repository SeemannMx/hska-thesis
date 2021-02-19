import 'package:flutter/widgets.dart';
import 'package:flutter_light/ui/home/a_home_page.dart';
import 'package:flutter_light/utils/key_store.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_setup.dart';

void main() {
  final Widget widget = HomePage();

  group("$widget - Test", () {
    testWidgets('$widget - Small Portrait - find any widget',(WidgetTester tester) async {
      initSmallPortrait();
      await before(tester, HomePage());

      bool foundWidgets = false;
      if(tester.allWidgets.length > 0) foundWidgets = true;

      expect(foundWidgets, true);
      dispose();
    });

    testWidgets('$widget - Medium Landscape - find any widget',(WidgetTester tester) async {
      initMediumLandscape();
      await before(tester, HomePage());

      bool foundWidgets = false;
      if(tester.allWidgets.length > 0) foundWidgets = true;

      expect(foundWidgets, true);
      dispose();
    });

    testWidgets('$widget - Small Portrait - find all keys in widget',(WidgetTester tester) async {
      initSmallPortrait();
      await before(tester, HomePage());

      tester.allWidgets.forEach((widget) {
        // Todo Missing Implementation
      });
      dispose();
    });

    testWidgets('$widget - Medium Landscape - find all widgets in keys',(WidgetTester tester) async {
      initMediumLandscape();
      await before(tester, HomePage());

      tester.allWidgets.forEach((widget) {
        // Todo Missing Implementation
      });
      dispose();
    });
  });


  group("$widget - Test", () {
    testWidgets('$widget - Small Portrait - find audit tile by Value Key', (WidgetTester tester) async {
      initSmallPortrait();
      await before(tester, HomePage());

      expect(find.byKey(ValueKey(KeyStore.HOME_AUDIT_BUTTON)), findsOneWidget);

      dispose();
    });
  });
}
