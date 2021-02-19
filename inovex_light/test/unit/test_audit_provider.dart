import 'package:flutter_light/usecases/audit_provider.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  AuditProvider auditProvider = AuditProvider();

  final String type = 'Unit Test';
  final String label = 'AuditProvider';

  String comment = "Test Comment";

  group('$type', () {
    test('$label - Add Comment', () {
      expect(auditProvider.data.length, 0);

      auditProvider.addComment("Text String");
      expect(auditProvider.data.length, 1);
    });

    test('$label - Add Multiple Comments', () {
      auditProvider..addComment(comment)..addComment(comment)..addComment(comment);
      expect(auditProvider.data.length, 1);
    });

    test('$label - Add Multiple Comments', () {
      auditProvider.takePhoto();
      expect(auditProvider.images.length, 1);
    }, skip: true);
  });
}
