import 'package:flutter/widgets.dart';
import 'package:flutter_light/utils/key_file.dart';
import 'package:flutter_test/flutter_test.dart';


String operatingSystem = "web";

extension KeyStringExtraction on Key {
  String toKeyString() {
    return this.toString().replaceAll("[<", '').replaceAll(">]", '').replaceAll("'", '').trim();
  }
}

extension WidgetKeyFinder on WidgetTester {
  Widget widgetWithKey(VALUE value) {
    return this.widget(find.byKey(ValueKey(value)));
  }
}

extension KeyStringCutter on String {
  String cut() {
    return this.replaceAll("VALUE.", "").replaceAll(",", "")._replace();
  }

  String _replace(){
    return 'VALUE.$this';
  }
}

