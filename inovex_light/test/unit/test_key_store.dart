import 'package:flutter_light/utils/key_store.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  final String type = 'Unit Test';
  final String label = 'Key Store';

  group('$type', () {
    test('$label - Key Management with Key Store', () {

      final keyValue = KeyStore.SPLASH_START_BUTTON;
      final keyString= 'SPLASH_START_BUTTON';

      expect(keyValue, keyString);
    });
  });
}
