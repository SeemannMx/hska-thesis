import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_light/usecases/audit_provider.dart';
import 'package:flutter_light/utils/custom_colors.dart';
import 'package:flutter_light/utils/key_file.dart';
import 'package:flutter_light/utils/key_store.dart';
import 'package:flutter_light/utils/screen_size_handler.dart';
import 'package:provider/provider.dart';

class AuditPagePortrait extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          key: ValueKey(VALUE.AUDIT_PAGE_SCAFFOLD),
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
          body: AuditStack(),
      ),
    );
  }
}

class AuditStack extends StatelessWidget {
  final padding = ScreenSizeHandler().dimen / 30;
  final dimen = ScreenSizeHandler().dimen / 10;

  @override
  Widget build(BuildContext context) {
    AuditProvider provider = Provider.of<AuditProvider>(context);

    return Stack(
      key: ValueKey(VALUE.AUDIT_PAGE_STACK),
      children: [
        _getInfoText(provider),
        Column(
          children: [
            _getComment(provider),
            _getImageList(provider),
            _getFabButtonRow(context, provider),
          ],
        ),
      ],
    );
  }

  Widget _getImageList(AuditProvider provider) {
    return Expanded(
      child: ListView.builder(
          itemCount: provider.images.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                key: ValueKey(VALUE.AUDIT_PAGE_FOTOS),
                height: ScreenSizeHandler().width,
                child: provider.images[index] == null
                    ? Text('No image selected.')
                    : Padding(
                        padding: EdgeInsets.all(padding / 2),
                        child: Image.file(provider.images[index]),
                      ));
          }),
    );
  }

  Widget _getFabButtonRow(BuildContext context, AuditProvider provider) {
    return Container(
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.only(bottom: padding / 2),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
              padding: EdgeInsets.symmetric(
                  vertical: padding / 2, horizontal: padding),
              child: FloatingActionButton(
                key: ValueKey(VALUE.AUDIT_PAGE_FAB_COMMENT),

                // Todo Flutter Bug Fix for subtree error heroTag must null
                heroTag: null,

                backgroundColor: inovexBlue,
                child: Icon(Icons.textsms_outlined),
                onPressed: () => provider.createDialog(context)
              )),

          (provider.hasCamera) ?
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: padding / 2, horizontal: padding),
            child: FloatingActionButton(
              key: ValueKey(VALUE.AUDIT_PAGE_FAB_FOTO),
              onPressed: provider.takePhoto,
              backgroundColor: inovexBlue,
              heroTag: null,
              child: Icon(Icons.add_a_photo),
            ),
          )
              : Container(),



          (provider.images.isNotEmpty || provider.data.isNotEmpty)
              ? Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: padding / 2, horizontal: padding),
                  child: FloatingActionButton(
                    key: ValueKey(VALUE.AUDIT_PAGE_FAB_SEND),
                    onPressed: provider.sendPhoto,
                    backgroundColor: inovexLightBlue,
                    heroTag: null,
                    child: Icon(Icons.check),
                  ),
                )
              : Container()
        ],
      ),
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

  Widget _getComment(AuditProvider provider) {
    return (provider.data.isEmpty)
        ? Container()
        : (Card(
            key: ValueKey(VALUE.AUDIT_PAGE_COMMENT),
            elevation: dimen,
            child: ExpandablePanel(
              header: Padding(
                  padding: EdgeInsets.only(
                      bottom: dimen / 4,
                      top: dimen / 4,
                      right: dimen / 2,
                      left: dimen / 2),
                  child: Text("Description",
                      style: TextStyle(
                          fontSize: ScreenSizeHandler().fontSize.medium,
                          fontFamily: 'Lato',
                          color: inovexLightBlack))),
              collapsed: Padding(
                padding: EdgeInsets.only(
                    bottom: dimen / 4, right: dimen / 2, left: dimen / 2),
                child: Text(
                  provider.data.first,
                  softWrap: true,
                  maxLines: 2,
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
          ));
  }
}
