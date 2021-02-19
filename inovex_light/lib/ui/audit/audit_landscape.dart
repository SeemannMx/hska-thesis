import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_light/usecases/audit_provider.dart';
import 'package:flutter_light/utils/custom_colors.dart';
import 'package:flutter_light/utils/key_file.dart';
import 'package:flutter_light/utils/key_store.dart';
import 'package:flutter_light/utils/screen_size_handler.dart';
import 'package:flutter_light/widgets/inovex_dialog.dart';
import 'package:provider/provider.dart';

class AuditPageLandscape extends StatelessWidget {

  final padding = ScreenSizeHandler().dimen / 30;
  final dimen = ScreenSizeHandler().dimen / 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: inovexBlue,
        centerTitle: false,
        title: Text(
          "Audit",
          key: ValueKey(KeyStore.AUDIT_HEADER_TEXT),
          style: TextStyle(
              fontSize: ScreenSizeHandler().fontSize.medium,
              fontFamily: 'Lato',
              color: Colors.white),
        ),
      ),
      key: ValueKey(VALUE.AUDIT_PAGE_SCAFFOLD),
      body: LayoutBuilder(builder: (context, constraints) {
        return _getBody(context);
      }),
    );
  }

  _getBody(BuildContext context) {
    AuditProvider provider = Provider.of<AuditProvider>(context);
    return Stack(
      children: [
        _getInfoText(provider),
        _getComment(provider),
        _getFabButtonRow(provider, context),
      ],
    );
  }

  Widget _getInfoText(AuditProvider provider) {
    if (provider.data.length > 0 || provider.images.length > 0)
      return Container();
    return Center(
        key: ValueKey(VALUE.AUDIT_PAGE_INFO_TEXT),
        child: Text("share your \nobservation",
            style: TextStyle(
                fontSize: ScreenSizeHandler().fontSize.medium,
                fontFamily: 'Lato',
                color: Colors.grey)));
  }

  Widget _getFabButtonRow(AuditProvider provider, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: padding / 2),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
              padding: EdgeInsets.symmetric(
                  vertical: padding / 2, horizontal: padding),
              child: FloatingActionButton(
                // key: ValueKey(VALUE.AUDIT_PAGE_FAB_COMMENT),
                // Todo Flutter Bug Fix for subtree error heroTag must null
                heroTag: null,

                backgroundColor: inovexBlue,
                child: Icon(Icons.textsms_outlined),
                onPressed: () {
                  String text = provider.text;
                  showDialog(
                      context: context,
                      useRootNavigator: false,
                      child: InovexDialog(
                          title: 'Report - Audit Item',
                          content: text,
                          leftLabel: 'cancel',
                          rightLabel: 'ok',
                          leftButtonCallback: () => Navigator.pop(context),
                          rightButtonCallback: () {
                            provider.addComment(text);
                            Navigator.pop(context);
                          }));
                },
              )),


          (provider.hasCamera) ?
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: padding / 2, horizontal: padding),
            child: FloatingActionButton(
              // key: ValueKey(VALUE.AUDIT_PAGE_FAB_FOTO),
              onPressed: provider.takePhoto,
              backgroundColor: inovexBlue,
              // Todo hero
              // heroTag: null,
              child: Icon(Icons.add_a_photo),
            ),
          )
              : Container(),


          (provider.images.isNotEmpty || provider.data.isNotEmpty)
              ? Padding(
            padding: EdgeInsets.symmetric(
                vertical: padding / 2, horizontal: padding),
            child: FloatingActionButton(
              // key: ValueKey(VALUE.AUDIT_PAGE_FAB_SEND),
              onPressed: provider.sendPhoto,
              backgroundColor: inovexLightBlue,
              // Todo hero
              //heroTag: null,
              child: Icon(Icons.check),
            ),
          )
              : Container()
        ],
      ),
    );
  }

  Widget _getComment(AuditProvider provider) {
    return (provider.data.isEmpty)
        ? Container()
        : Container(
      margin: EdgeInsets.only(
          top: dimen / 2,
          bottom: dimen / 2,
          right: dimen / 2,
          left: dimen / 2),
      child: (Card(
        key: ValueKey(VALUE.AUDIT_PAGE_COMMENT),
        elevation: dimen,
        child: ExpandablePanel(
          // ignore: deprecated_member_use
          hasIcon: false,
          header: Padding(
              padding: EdgeInsets.only(
                  bottom: dimen / 4,
                  top: dimen / 4,
                  right: dimen / 2,
                  left: dimen / 2),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: dimen / 4),
                    child: Icon(Icons.arrow_drop_down_sharp),
                  ),
                  Text("Description",
                      style: TextStyle(
                          fontSize: ScreenSizeHandler().fontSize.medium,
                          fontFamily: 'Lato',
                          color: inovexLightBlack)),
                ],
              )),
          collapsed: Padding(
            padding: EdgeInsets.only(
                bottom: dimen / 4, right: dimen / 2, left: dimen / 2),
            child: Text(
              provider.data.first,
              softWrap: true,
              maxLines: 10,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          expanded: Padding(
            padding: EdgeInsets.only(
                bottom: dimen / 4, right: dimen / 2, left: dimen / 2),
            child: Text(
              provider.data.first,
              softWrap: true,
            ),
          ),
        ),
      )),
    );
  }
}
