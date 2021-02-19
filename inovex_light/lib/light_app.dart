import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_light/ui/audit/a_audit_page.dart';
import 'package:flutter_light/ui/home/a_home_page.dart';
import 'package:flutter_light/ui/splash/a_splash_page.dart';
import 'package:flutter_light/usecases/audit_provider.dart';
import 'package:flutter_light/usecases/inventur_provider.dart';
import 'package:flutter_light/utils/custom_config.dart';
import 'package:flutter_light/utils/screen_size_handler.dart';
import 'package:provider/provider.dart';

class InovexLightApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (!kIsWeb) operatingSystem = Platform.operatingSystem;

    return MultiProvider(
        providers: [
          Provider(create: (_) => ScreenSizeHandler()),
          ChangeNotifierProvider(create: (_) => AuditProvider()),
          ChangeNotifierProvider(create: (_) => InventurProvider()),
        ],
        child: MaterialApp(
          title: '$operatingSystem | inovex light',
          initialRoute: SplashPage.route,
          home: HomePage(),
          routes: {
            SplashPage.route: (context) => SplashPage(),
            HomePage.route: (context) => HomePage(),
            AuditPage.route: (context) => AuditPage(),
          },
          debugShowCheckedModeBanner: false,
          showPerformanceOverlay: false,
          //debugShowMaterialGrid: true,
        ));
  }
}
