import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_light/usecases/audit_provider.dart';
import 'package:lipsum/lipsum.dart' as lipsum;
import 'package:mockito/mockito.dart';

/// MockFile
/// MockFile mock = MockFile();
/// when(mock.path).thenAnswer((_) => 'test_image.png');
/// images.add(mock);
class MockFile extends Mock implements File {}

class FakeProvider extends AuditProvider {

  List <File> images = [];
  List <String> data = [];

  bool isSend = false;
  bool hasCamera = false;
  int _completed = 0;

  String text = lipsum.createParagraph();

  Future<bool> checkForCamera([bool parameter]) async {
    hasCamera = parameter ?? false;
    if(_completed == 1 )print('completed: $_completed++');
    return hasCamera;
  }

  Future takePhoto() async {
    try{
      images.add(File('test_image.png'));
      notifyListeners();
    } on MissingPluginException {
      print("missing plugin implementation");
    }
  }

  Future sendPhoto() async {
    try{
      images.clear();
      data.clear();
      isSend = true;
      notifyListeners();
    } on MissingPluginException {
      print("missing plugin implementation");
    }
  }

  void addComment(String comment){
    try{
      data..clear()..add(comment);
      notifyListeners();
    } on MissingPluginException {
      print("missing plugin implementation");
    }
  }

  void createDialog(BuildContext context){
    addComment(text);
  }
}

