import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_light/ui/audit/audit_landscape.dart';
import 'package:flutter_light/ui/audit/audit_portrait.dart';
import 'package:flutter_light/usecases/audit_provider.dart';
import 'package:flutter_light/utils/custom_colors.dart';
import 'package:flutter_light/utils/key_store.dart';
import 'package:flutter_light/utils/page_initializer.dart';
import 'package:flutter_light/utils/screen_size_handler.dart';
import 'package:provider/provider.dart';

import 'dart:developer' as dev;

class AuditPage extends StatelessWidget with PageInitializer {
  static String route = "/audit";

  @override
  Widget build(BuildContext context) {
    super.initScreenSize(context);
    Widget widget;

    if (ScreenSizeHandler().myScreenSize == ScreenSize.FALLBACK) return Placeholder();

    return FutureBuilder<bool>(
        future: Provider.of<AuditProvider>(context).checkForCamera(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            widget = MyAuditPage();
          } else {
            widget = MyIndicatorPage();
          }
          return widget;
        });
  }
}

class MyAuditPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // dev.log('re-build audit page with orientation', name: this.runtimeType.toString());

    return (ScreenSizeHandler().myOrientation ==
        ScreenOrientation.PORTRAIT)
        ? AuditPagePortrait()
        : AuditPageLandscape();
  }
}

class MyIndicatorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: ValueKey(KeyStore.MY_INDICATOR_PAGE),
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          color: Colors.white,
          height:  MediaQuery.of(context).size.width / 3,
          width: MediaQuery.of(context).size.width / 3,
          child: CircularProgressIndicator(
            backgroundColor: inovexBlue,
            valueColor: AlwaysStoppedAnimation<Color>(inovexAccent),
          ),
        ),
      ),
    );
  }
}
