import 'package:flutter/material.dart';
import 'package:flutter_light/ui/audit/a_audit_page.dart';
import 'package:flutter_light/utils/custom_colors.dart';
import 'package:flutter_light/utils/key_file.dart';
import 'package:flutter_light/utils/key_store.dart';
import 'package:flutter_light/utils/screen_size_handler.dart';
import 'package:flutter_light/widgets/clipper/wiki_tile_clipper.dart';
import 'package:flutter_light/widgets/tile_audit.dart';
import 'package:flutter_light/widgets/tile_blank.dart';
import 'package:flutter_light/widgets/tile_blog.dart';
import 'package:flutter_light/widgets/tile_wiki.dart';

class HomeContentCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double corner = (constraints.maxHeight + constraints.maxWidth) / 4;
      double padding = (constraints.maxHeight + constraints.maxWidth) / 200;

      return Container(
          child: Row(
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                    top: padding, bottom: padding / 2, left: padding, right: 0),
                height: constraints.maxHeight / 2,
                width: constraints.maxWidth / 3,
                child: _getEventsTile(),
              ),
              Container(
                padding: EdgeInsets.only(
                    top: padding / 2, bottom: padding, left: padding, right: 0),
                height: constraints.maxHeight / 2,
                width: constraints.maxWidth / 3,
                child: _getNewsTile(),
              )
            ],
          ),
          Container(
            height: constraints.maxHeight,
            width: constraints.maxWidth - (constraints.maxWidth * 1 / 3),
            child: Stack(
              children: [
                Align(alignment: Alignment.center, child: _getTitleTile()),
                Align(
                  alignment: Alignment.topCenter,
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            top: padding,
                            bottom: padding / 2,
                            left: padding,
                            right: padding / 2),
                        height: constraints.maxHeight / 2,
                        width: constraints.maxWidth / 3,
                        child: _getBlankTile(constraints, corner),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            top: padding,
                            bottom: padding / 2,
                            left: padding / 2,
                            right: padding),
                        height: constraints.maxHeight / 2,
                        width: constraints.maxWidth / 3,
                        child: _getBlogTile(constraints, corner),
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            top: padding / 2,
                            bottom: padding,
                            left: padding,
                            right: padding / 2),
                        height: constraints.maxHeight / 2,
                        width: constraints.maxWidth / 3,
                        child: _getAuditTile(context, constraints, corner),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            top: padding / 2,
                            bottom: padding,
                            left: padding / 2,
                            right: padding),
                        height: constraints.maxHeight / 2,
                        width: constraints.maxWidth / 3,
                        child: _getWikiTile(constraints, corner),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ));
    });
  }

  Widget _getTitleTile() {
    return Container(
      key: ValueKey(VALUE.HOME_PAGE_TITLE),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("inovex",
              style: TextStyle(
                  fontSize: ScreenSizeHandler().fontSize.large,
                  fontFamily: 'Oleo',
                  color: inovexLightGrey)),
          Text("Light",
              style: TextStyle(
                  fontSize: ScreenSizeHandler().fontSize.large,
                  fontFamily: 'Oleo',
                  color: inovexLightGrey))
        ],
      ),
    );
  }

  Widget _getEventsTile() {
    return GestureDetector(
      key: ValueKey(VALUE.HOME_PAGE_CARD_EVENT),
      onTap: null,
      child: Container(
          color: inovexLightGrey,
          child: Center(
              child: Text("Events",
                  style: TextStyle(
                      fontSize: ScreenSizeHandler().fontSize.medium,
                      fontFamily: 'Lato',
                      color: inovexDarkBlue))
              )),
    );
  }

  Widget _getNewsTile() {
    return Container(
      key: ValueKey(VALUE.HOME_PAGE_CARD_NEWS),
      color: inovexLightGrey,
      child: GestureDetector(
          onTap: null,
          child: Center(
              child: Text("News",
                  style: TextStyle(
                      fontSize: ScreenSizeHandler().fontSize.medium,
                      fontFamily: 'Lato',
                      color: inovexDarkBlue)))),
    );
  }

  Widget _getBlankTile(BoxConstraints constraints, double corner) {
    return Container(
      key: ValueKey(VALUE.HOME_PAGE_CARD_BLANK),
      child: BlankTile(
          Size(constraints.maxWidth, constraints.maxHeight),
          corner,
          Center(
              child: Text("Welcome",
                  style: TextStyle(
                      fontSize: ScreenSizeHandler().fontSize.medium,
                      fontFamily: 'Lato',
                      color: Colors.white))
              )),
    );
  }

  Widget _getBlogTile(BoxConstraints constraints, double corner) {
    return GestureDetector(
        key: ValueKey(VALUE.HOME_PAGE_CARD_BLOG),
        onTap: null,
        child: Container(
          child: BlogTileHome(
            Size(constraints.maxWidth * 0.375, constraints.maxHeight * 0.245),
            corner,
            Center(
                child: Text("Blog",
                    style: TextStyle(
                        fontSize: ScreenSizeHandler().fontSize.medium,
                        fontFamily: 'Lato',
                        color: Colors.white))
                ),
          ),
        ));
  }

  Widget _getAuditTile(BuildContext context, BoxConstraints constraints, double corner) {
    return GestureDetector(
      key: ValueKey(KeyStore.HOME_AUDIT_BUTTON),
      onTap: () { Navigator.pushNamed(context, AuditPage.route); },
      child: Container(
        child: AuditTileHome(
          Size(constraints.maxWidth * 0.375, constraints.maxHeight * 0.245),
          corner,
          Center(
              child: Text("Audit",
                  style: TextStyle(
                      fontSize: ScreenSizeHandler().fontSize.medium,
                      fontFamily: 'Lato',
                      color: Colors.white))
              // child: MyText("Audit", ScreenSizeHandler().fontSize.medium, 'Lato', Colors.white)
              ),
        ),
      ),
    );
  }

  Widget _getWikiTile(BoxConstraints constraints, double corner) {
    return GestureDetector(
        key: ValueKey(VALUE.HOME_PAGE_CARD_WIKI),
        onTap: null,
        child: Container(
            child: WikiTileHome(
                Size(constraints.maxWidth, constraints.maxHeight),
                corner,
                Center(
                    child: Text("Wiki",
                        style: TextStyle(
                            fontSize: ScreenSizeHandler().fontSize.medium,
                            fontFamily: 'Lato',
                            color: Colors.white))
                    //  child: MyText("Wiki", ScreenSizeHandler().fontSize.medium,'Lato', Colors.white)
                    ),
                WikiTileClipperLandscape(corner))));
  }
}
