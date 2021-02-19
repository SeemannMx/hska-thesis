#!/bin/sh
clear
rm widget/failures/*
cd ..

pwd

#echo
#echo Run all Unit-Tests
#flutter test test/unit/test_screen_size_handler.dart
#flutter test test/unit/test_audit_provider.dart
#flutter test test/unit/test_extensions.dart
#flutter test test/unit/test_key_store.dart
#flutter test test/unit/test_string_handler.dart

#echo
#echo Run all Widget-Tests
flutter test --coverage test/widget/widget_test_splash_page.dart
#flutter test test/widget/widget_test_home_page.dart
#flutter test test/widget/widget_test_audit_page.dart

#echo
#echo Run all Golden-Tests#flutter test test/widget/golden_test_splash.dart
##flutter test test/widget/golden_test_home.dart
#
## update golden image if non exists
##flutter test --update-goldens test/widget/golden_test_splash.dart

#flutter test --update-goldens test/widget/golden_test_home.dart

#echo
#echo Run all Integration-Tests - Mobile Emulator has to been on
#flutter drive --target=test_driver/app.dart

#echo Run all Integration-Tests - Web
#cd ..
#flutter drive --target=test_driver/app.dart --browser-name=chrome --browser-dimension 800,800 --debug

# Run Code Coverage Tool
lcov --summary coverage/lcov.info
lcov -l coverage/lcov.info

