import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_light/widgets/inovex_dialog.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lipsum/lipsum.dart' as lipsum;
import 'package:permission_handler/permission_handler.dart';

import 'dart:developer' as dev;

class AuditProvider extends ChangeNotifier {
  List<File> images = [];
  List<String> data = [];

  bool _hasCamera;

  bool get hasCamera => _hasCamera;

  bool _isSend = false;

  bool get isSend => _isSend;

  String text = lipsum.createParagraph(numParagraphs: 4);

  int _completed = 0;

  Future<bool> checkForCamera() async {
    if(_completed == 1) return _hasCamera;
    bool fail = false;

    Future.delayed(Duration(seconds: 2), () async {
      await Permission.camera.status
          .timeout(Duration(seconds: 2), onTimeout: () {
            dev.log(this.runtimeType.toString(), name: 'Timeout');
            fail = true;
            return null;
      }).catchError((e) {
            dev.log(this.runtimeType.toString(), name: 'Error');
            fail = true;
      });
      _hasCamera = fail ? false : true;
      _completed++;
      notifyListeners();
    });

    return _hasCamera;
  }

  Future takePhoto() async {
    try {
      // / what if no image has been provided - return form cam without image
      images.add(File(
          (await ImagePicker().getImage(source: ImageSource.camera)).path));
      notifyListeners();
    } on MissingPluginException {
      print("missing plugin implementation");
    }
  }

  Future sendPhoto() async {
    try {
      images.clear();
      data.clear();

      _isSend = true;
      notifyListeners();
    } on MissingPluginException {
      print("missing plugin implementation");
    }
  }

  void addComment(String comment) {
    try {
      data
        ..clear()
        ..add(comment);
      notifyListeners();
    } on MissingPluginException {
      print("missing plugin implementation");
    }
  }

  void createDialog(BuildContext context) {
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
              addComment(text);
              Navigator.pop(context);
            }));
  }
}
