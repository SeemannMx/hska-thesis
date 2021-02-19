import 'package:flutter/material.dart';
import 'package:flutter_light/usecases/audit_provider.dart';
import 'package:flutter_light/usecases/fake_provider.dart';
import 'package:flutter_light/utils/key_file.dart';
import 'package:flutter_light/utils/screen_size_handler.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import '../../test_setup.dart';

class AuditPageBehaviorTest implements BasePageTest {
  AuditPageBehaviorTest(this.tester);

  @override
  String label;

  @override
  WidgetTester tester;

  @override
  Widget testWidget;

  final findCommentFab = find.byKey(ValueKey(VALUE.AUDIT_PAGE_FAB_COMMENT));
  final findFotoFab = find.byKey(ValueKey(VALUE.AUDIT_PAGE_FAB_FOTO));
  final findSendFab = find.byKey(ValueKey(VALUE.AUDIT_PAGE_FAB_SEND));
  final findComment = find.byKey(ValueKey(VALUE.AUDIT_PAGE_COMMENT));
  final findFotos = find.byKey(ValueKey(VALUE.AUDIT_PAGE_FOTOS));

  @override
  Future<void> run(Widget widget) async {
    testWidget = widget;
    await prepare();

    // run all page related widget tests
    await _auditPageBehaviorWidgetTest();
    await _otherWidgetTest();
  }

  Future<void> prepare() async {
    await tester.pumpWidget(MultiProvider(
        providers: [
          ChangeNotifierProvider<AuditProvider>(create: (_) => FakeProvider()),
        ],
        child: MaterialApp(
          home: LayoutBuilder(builder: (context, constraints) {
            return Consumer <AuditProvider> (builder: (context, provider, child) {
              ScreenSizeHandler().initScreen(constraints.maxWidth, constraints.maxHeight);
              (provider as FakeProvider).checkForCamera(true);
              return testWidget;
            });
          }),
        )));
  }

  Future _auditPageBehaviorWidgetTest() async {
    expect(findCommentFab, findsOneWidget);
    expect(findFotoFab, findsOneWidget);
    expect(findSendFab, findsNothing);
    expect(findComment, findsNothing);
    expect(findFotos, findsNothing);

    await tester.tap(findCommentFab);
    await tester.tap(findFotoFab);
    await tester.pumpAndSettle();

    expect(findCommentFab, findsOneWidget);
    expect(findFotoFab, findsOneWidget);
    expect(findSendFab, findsOneWidget);
    expect(findComment, findsOneWidget);
    expect(findFotos, findsOneWidget);

    await tester.tap(findSendFab);
    await tester.pumpAndSettle();

    expect(findCommentFab, findsOneWidget);
    expect(findFotoFab, findsOneWidget);
    expect(findSendFab, findsNothing);
    expect(findComment, findsNothing);
    expect(findFotos, findsNothing);
  }

  Future _otherWidgetTest() async {
    // Todo Missing Implementation
  }
}
