import 'package:flutter_light/utils/screen_size_handler.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final handler = ScreenSizeHandler();

  final String type = 'Unit Test';
  final String label = 'ScreenSizeHandler';

  group('$type', () {
    test('$label- Orientation', () {
      handler.initScreen(400, 600);
      expect(handler.myOrientation, ScreenOrientation.LANDSCAPE);

      handler.initScreen(600, 400);
      expect(handler.myOrientation, ScreenOrientation.PORTRAIT);

      handler.initScreen(500, 500);
      expect(handler.myOrientation, ScreenOrientation.PORTRAIT);
    });

    test('$label - Size', () {
      handler.initScreen(500, 500);
      expect(handler.myScreenSize, ScreenSize.SMALL);

      handler.initScreen(1000, 1000);
      expect(handler.myScreenSize, ScreenSize.MEDIUM);

      handler.initScreen(10, 10);
      expect(handler.myScreenSize, ScreenSize.FALLBACK);
    });

    test('$label - Font', () {
      handler.initScreen(500, 500);
      expect(handler.myScreenSize, ScreenSize.SMALL);
      expect(handler.fontSize.tiny, handler.fontSize.small);
    });
  });
}