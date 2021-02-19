import 'package:flutter/material.dart';
import 'package:flutter_light/ui/audit/a_audit_page.dart';
import 'package:flutter_light/utils/custom_colors.dart';
import 'package:flutter_light/utils/key_file.dart';
import 'package:flutter_light/utils/key_store.dart';
import 'package:flutter_light/utils/page_initializer.dart';
import 'package:flutter_light/utils/screen_size_handler.dart';
import 'package:flutter_light/widgets/custom_drawer.dart';
import 'package:flutter_light/widgets/custom_menu_header.dart';
import 'package:flutter_light/widgets/inovex_logo.dart';
import 'package:flutter_light/widgets/tile_audit.dart';
import 'package:flutter_light/widgets/tile_blog.dart';
import 'package:flutter_light/widgets/tile_wiki.dart';

class HomePagePortrait extends StatelessWidget with PageHelper {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: ValueKey(VALUE.HOME_PAGE_SCAFFOLD),
        drawerScrimColor: Colors.black45.withAlpha(225),
        drawer: CustomDrawer(),
        backgroundColor: Colors.white,
        body: LayoutBuilder(builder: (context, constraints) {
          double logoDimen = constraints.maxWidth * 0.725;
          Size logoSize = Size(logoDimen / 2, logoDimen / 2);

          return Stack(
            children: [
              _getBody(context, constraints),
              _getLogo(logoSize)],
          );
        }));
  }

  Widget _getBody(BuildContext context, BoxConstraints constraints) {
    double corner = constraints.maxWidth * 0.65;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _getFirstRowInColumn(constraints, corner),
        _getSecondRowInColumn(context, constraints, corner),
        _getThirdRowInColumn(constraints, corner)
      ],
    );
  }

  Widget _getLogo(Size logoSize) {
    return Align(
        alignment: Alignment(0.375, 0.010), child: InovexLogo(logoSize)
    );
  }

  Widget _getFirstRowInColumn(BoxConstraints constraints, double corner) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            key: ValueKey(VALUE.HOME_PAGE_MENU),
            height: constraints.maxHeight / 2,
            width: constraints.maxWidth * 0.61,
            child: Container(
                child: CustomDrawerHeader(corner))),
        Container(
            height: constraints.maxHeight * 0.5,
            width: constraints.maxWidth * 0.375,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GestureDetector(
                  key: ValueKey(VALUE.HOME_PAGE_CARD_EVENT),
                  onTap: null,
                  child: Container(
                    height: constraints.maxHeight * 0.245,
                    color: inovexLightGrey,
                    child: Center(child: Text(
                      "Events",
                      style: TextStyle(
                          fontSize: ScreenSizeHandler().fontSize.large,
                          fontFamily: 'Lato',
                          color: inovexDarkGrey
                      ),
                    ),
                    ),
                  ),
                ),
                GestureDetector(
                  key: ValueKey(VALUE.HOME_PAGE_CARD_BLOG),
                  onTap: null,
                  child: Container(
                    height: constraints.maxHeight * 0.245,
                    width: constraints.maxWidth * 0.375,
                    child: BlogTileHome(
                      Size(constraints.maxWidth * 0.375,
                          constraints.maxHeight * 0.245),
                      corner,
                      Center(
                          child:
                          Text(
                            "Blog",
                            style: TextStyle(
                                fontSize: ScreenSizeHandler().fontSize.large,
                                fontFamily: 'Lato',
                                color: inovexDarkGrey
                            ),
                          ),
                      ),
                    ),
                  ),
                )
              ],
            )),
      ],
    );
  }

  Widget _getSecondRowInColumn(
      BuildContext context, BoxConstraints constraints, double corner) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        GestureDetector(
          key: ValueKey(KeyStore.HOME_AUDIT_BUTTON),
          onTap: () { Navigator.pushNamed(context, AuditPage.route); },
          child: Container(
            height: constraints.maxHeight * 0.245,
            width: constraints.maxWidth * 0.61,
            child: AuditTileHome(
              Size(constraints.maxWidth * 0.375, constraints.maxHeight * 0.245),
              corner,
              Center(
                child: Text(
                  "Audit",
                  style: TextStyle(
                      fontSize: ScreenSizeHandler().fontSize.large * 1.5,
                      fontFamily: 'Lato',
                      color: Colors.white
                  ),
                ),
              ),
            ),
          ),
        ),

        GestureDetector(
          key: ValueKey(VALUE.HOME_PAGE_CARD_WIKI),
          onTap: null,
          child: Container(
              height: constraints.maxHeight * 0.245,
              width: constraints.maxWidth * 0.375,
              child: WikiTileHome(
                  Size(constraints.maxWidth * 0.375,
                      constraints.maxHeight * 0.245),
                  corner,
                  Center(
                    child: Text(
                        "Wiki",
                        style: TextStyle(
                            fontSize: ScreenSizeHandler().fontSize.large,
                            fontFamily: 'Lato',
                            color: inovexDarkGrey
                        ),
                    ),
                  ))),
        )
      ],
    );
  }

  Widget _getThirdRowInColumn(BoxConstraints constraints, double corner) {
    return Container(
      height: constraints.maxHeight * 0.245,
      width: constraints.maxWidth,
      color: inovexLightGrey,
      child: GestureDetector(
        key: ValueKey(VALUE.HOME_PAGE_CARD_NEWS),
        onTap: null,
        child: Center(child: Text(
          "Newsletter",
          style: TextStyle(
              fontSize: ScreenSizeHandler().fontSize.large * 2.5,
              fontFamily: 'Lato',
              color: inovexDarkGrey
          ),
        ),),
      ),
    );
  }
}


