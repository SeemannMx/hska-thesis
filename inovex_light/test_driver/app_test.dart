import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_light/utils/key_store.dart';
import 'package:test/test.dart';

void main() {
  final findStartButtonInSplash = find.byValueKey(KeyStore.SPLASH_START_BUTTON);
  final findAuditButtonInHome = find.byValueKey(KeyStore.HOME_AUDIT_BUTTON);
  final findAuditTextInAudit = find.byValueKey(KeyStore.AUDIT_HEADER_TEXT);
  final findMyIndicatorInsteadOfAudit =
      find.byValueKey(KeyStore.MY_INDICATOR_PAGE);

  FlutterDriver driver;

  group('Inovex Light Test', () {
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('check flutter driver health', () async {
      final health = await driver.checkHealth();
      expect(health.status, HealthStatus.ok);
    });

    test('check kpi', () async {

      // Record a performance timeline as the app scrolls through the list of items.
      final timeline = await driver.traceAction(() async {
        /// get kpi
      });

      // Convert the Timeline into a TimelineSummary that's easier to read and
      // understand.
      final summary = TimelineSummary.summarize(timeline);

      // Then, save the summary to disk.
      await summary.writeSummaryToFile('summary', pretty: true);
    });

    test('Simple Test', () async {
      await driver.runUnsynchronized(() async {

        await driver.waitFor(findStartButtonInSplash);
        await driver.tap(findStartButtonInSplash);
        await driver.waitFor(findAuditButtonInHome);
        await driver.tap(findAuditButtonInHome);
        await driver.waitFor(findMyIndicatorInsteadOfAudit);
        await delay(sec: 4);
        await driver.waitFor(findAuditTextInAudit);

        expect(findAuditTextInAudit.serialize().values.elementAt(1), KeyStore.AUDIT_HEADER_TEXT);

      });

      // expect(findStartButton.serialize().values.elementAt(1).toString(), VALUE.SPLASH_PAGE_START_BUTTON.toString());
    });
  });
}

Future<void> delay({int sec}) async {
  await Future<void>.delayed(Duration(seconds: sec));
}
