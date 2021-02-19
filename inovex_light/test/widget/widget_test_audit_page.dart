import 'package:flutter_light/ui/audit/audit_landscape.dart';
import 'package:flutter_light/ui/audit/audit_portrait.dart';
import 'package:flutter_test/flutter_test.dart';
import '../test_setup.dart';
import 'page_tests/audit_page_behavior.dart';
import 'page_tests/audit_page_camera.dart';

void main() {
  String label = 'AuditPage';

  group("$label Test", () {
    testWidgets('Camera: Behavior, with given comment and a photo', (
        WidgetTester tester) async {
      initSmallPortrait();

      AuditPageBehaviorTest behaviorTest = AuditPageBehaviorTest(tester);
      behaviorTest.run(AuditPagePortrait());

      dispose();
    }, skip: false);

    testWidgets('No Camera: Behavior, with given comment', (
        WidgetTester tester) async {
      initMediumLandscape();

      AuditPageCameraTest cameraTest = AuditPageCameraTest(tester);
      cameraTest.run(AuditPageLandscape());

      dispose();
    }, skip: false);
  });
}
